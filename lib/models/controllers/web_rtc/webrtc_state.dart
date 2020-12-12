import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:twilioSample/models/entities/webrtc.dart';

part 'webrtc_state.freezed.dart';

@freezed
abstract class WebRtcState with _$WebRtcState {
  const factory WebRtcState({
    @Default(VideoInfo()) VideoInfo localVideoInfo,
    @Default(VideoInfo()) VideoInfo remoteVideoInfo,
  }) = _WebRtcState;
}
