import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:twilioSample/models/models.dart';
import 'package:twilioSample/utils/constants.dart';
import 'package:twilio_programmable_video/twilio_programmable_video.dart';
import 'package:http/http.dart' as http;

class WebRtcController extends StateNotifier<WebRtcState> {
  WebRtcController() : super(const WebRtcState()) {
    debugPrint('$tag: initialized');
    initializeWebRtc();
  }

  static const tag = 'WebRtcController';

  CameraCapturer _cameraCapturer;
  Room _room;
  StreamSubscription _onConnectedSubscription;
  StreamSubscription _onParticipantConnectedSubscription;
  StreamSubscription _onParticipantDisconnectedSubscription;
  final _remoteParticipantSubscriptions = <StreamSubscription>[];

  Future<void> initializeWebRtc() async {
    final response = await http.get(Constants.twilioTokenEndpoint);
    final data = json.decode(response.body) as Map<String, dynamic>;
    await TwilioProgrammableVideo.debug(dart: true, native: true);
    await TwilioProgrammableVideo.requestPermissionForCameraAndMicrophone();
    _cameraCapturer = CameraCapturer(CameraSource.FRONT_CAMERA);
    final connectOptions = ConnectOptions(
      data['token'] as String,
      roomName: 'VideoRoom',
      preferredAudioCodecs: [OpusCodec()],
      audioTracks: [LocalAudioTrack(true)],
      dataTracks: [LocalDataTrack()],
      videoTracks: [LocalVideoTrack(true, _cameraCapturer)],
      enableNetworkQuality: true,
      networkQualityConfiguration: NetworkQualityConfiguration(
        remote: NetworkQualityVerbosity.NETWORK_QUALITY_VERBOSITY_MINIMAL,
      ),
      enableDominantSpeaker: true,
    );
    _room = await TwilioProgrammableVideo.connect(connectOptions);

    if (_room != null) {
      _onConnectedSubscription = _room.onConnected.listen(_onConnected);
      _onParticipantConnectedSubscription =
          _room.onParticipantConnected.listen(_onParticipantConnected);
      _onParticipantDisconnectedSubscription =
          _room.onParticipantDisconnected.listen(_onParticipantDisconnected);
    }
  }

  void _onConnected(Room room) {
    TwilioProgrammableVideo.setSpeakerphoneOn(true);
    final localTrack =
        room.localParticipant.localVideoTracks[0].localVideoTrack;
    final localWidget = localTrack.widget();
    state = state.copyWith(
      localVideoInfo: VideoInfo(
        id: room.localParticipant.identity,
        widget: localWidget,
      ),
    );
    for (final participant in room.remoteParticipants) {
      if (state.remoteVideoInfo.id != participant.identity) {
        final subscription = participant.onVideoTrackSubscribed.listen(
          (event) {
            if (state.remoteVideoInfo.id == participant.identity) {
              return;
            }

            final widget = event.remoteVideoTrack.widget();
            final id = event.remoteParticipant.identity;
            state = state.copyWith(
              remoteVideoInfo: VideoInfo(
                id: id,
                widget: widget,
              ),
            );
          },
        );
        _remoteParticipantSubscriptions.add(subscription);
      }
    }
  }

  void _onParticipantConnected(RoomParticipantConnectedEvent event) {
    final subscription = event.remoteParticipant.onVideoTrackSubscribed.listen(
      (event) {
        if (state.remoteVideoInfo.id == event.remoteParticipant.identity) {
          return;
        }

        final widget = event.remoteVideoTrack.widget();
        final id = event.remoteParticipant.identity;
        state = state.copyWith(
          remoteVideoInfo: VideoInfo(
            id: id,
            widget: widget,
          ),
        );
      },
    );
    _remoteParticipantSubscriptions.add(subscription);
  }

  void _onParticipantDisconnected(RoomParticipantDisconnectedEvent event) {
    state = state.copyWith(remoteVideoInfo: const VideoInfo());
  }

  Future<void> endCall() async {
    state = state.copyWith(
      localVideoInfo: const VideoInfo(),
    );
    await _onConnectedSubscription?.cancel();
    await _onParticipantConnectedSubscription?.cancel();
    await _onParticipantDisconnectedSubscription?.cancel();
    for (final subscription in _remoteParticipantSubscriptions) {
      await subscription?.cancel();
    }
    await _room?.disconnect();
    _room = null;
    _cameraCapturer = null;
  }

  @override
  Future<void> dispose() async {
    debugPrint('$tag: dispose called');
    super.dispose();
  }
}
