// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'webrtc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$WebRtcStateTearOff {
  const _$WebRtcStateTearOff();

// ignore: unused_element
  _WebRtcState call(
      {VideoInfo localVideoInfo = const VideoInfo(),
      VideoInfo remoteVideoInfo = const VideoInfo()}) {
    return _WebRtcState(
      localVideoInfo: localVideoInfo,
      remoteVideoInfo: remoteVideoInfo,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $WebRtcState = _$WebRtcStateTearOff();

/// @nodoc
mixin _$WebRtcState {
  VideoInfo get localVideoInfo;
  VideoInfo get remoteVideoInfo;

  $WebRtcStateCopyWith<WebRtcState> get copyWith;
}

/// @nodoc
abstract class $WebRtcStateCopyWith<$Res> {
  factory $WebRtcStateCopyWith(
          WebRtcState value, $Res Function(WebRtcState) then) =
      _$WebRtcStateCopyWithImpl<$Res>;
  $Res call({VideoInfo localVideoInfo, VideoInfo remoteVideoInfo});
}

/// @nodoc
class _$WebRtcStateCopyWithImpl<$Res> implements $WebRtcStateCopyWith<$Res> {
  _$WebRtcStateCopyWithImpl(this._value, this._then);

  final WebRtcState _value;
  // ignore: unused_field
  final $Res Function(WebRtcState) _then;

  @override
  $Res call({
    Object localVideoInfo = freezed,
    Object remoteVideoInfo = freezed,
  }) {
    return _then(_value.copyWith(
      localVideoInfo: localVideoInfo == freezed
          ? _value.localVideoInfo
          : localVideoInfo as VideoInfo,
      remoteVideoInfo: remoteVideoInfo == freezed
          ? _value.remoteVideoInfo
          : remoteVideoInfo as VideoInfo,
    ));
  }
}

/// @nodoc
abstract class _$WebRtcStateCopyWith<$Res>
    implements $WebRtcStateCopyWith<$Res> {
  factory _$WebRtcStateCopyWith(
          _WebRtcState value, $Res Function(_WebRtcState) then) =
      __$WebRtcStateCopyWithImpl<$Res>;
  @override
  $Res call({VideoInfo localVideoInfo, VideoInfo remoteVideoInfo});
}

/// @nodoc
class __$WebRtcStateCopyWithImpl<$Res> extends _$WebRtcStateCopyWithImpl<$Res>
    implements _$WebRtcStateCopyWith<$Res> {
  __$WebRtcStateCopyWithImpl(
      _WebRtcState _value, $Res Function(_WebRtcState) _then)
      : super(_value, (v) => _then(v as _WebRtcState));

  @override
  _WebRtcState get _value => super._value as _WebRtcState;

  @override
  $Res call({
    Object localVideoInfo = freezed,
    Object remoteVideoInfo = freezed,
  }) {
    return _then(_WebRtcState(
      localVideoInfo: localVideoInfo == freezed
          ? _value.localVideoInfo
          : localVideoInfo as VideoInfo,
      remoteVideoInfo: remoteVideoInfo == freezed
          ? _value.remoteVideoInfo
          : remoteVideoInfo as VideoInfo,
    ));
  }
}

/// @nodoc
class _$_WebRtcState with DiagnosticableTreeMixin implements _WebRtcState {
  const _$_WebRtcState(
      {this.localVideoInfo = const VideoInfo(),
      this.remoteVideoInfo = const VideoInfo()})
      : assert(localVideoInfo != null),
        assert(remoteVideoInfo != null);

  @JsonKey(defaultValue: const VideoInfo())
  @override
  final VideoInfo localVideoInfo;
  @JsonKey(defaultValue: const VideoInfo())
  @override
  final VideoInfo remoteVideoInfo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WebRtcState(localVideoInfo: $localVideoInfo, remoteVideoInfo: $remoteVideoInfo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WebRtcState'))
      ..add(DiagnosticsProperty('localVideoInfo', localVideoInfo))
      ..add(DiagnosticsProperty('remoteVideoInfo', remoteVideoInfo));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WebRtcState &&
            (identical(other.localVideoInfo, localVideoInfo) ||
                const DeepCollectionEquality()
                    .equals(other.localVideoInfo, localVideoInfo)) &&
            (identical(other.remoteVideoInfo, remoteVideoInfo) ||
                const DeepCollectionEquality()
                    .equals(other.remoteVideoInfo, remoteVideoInfo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(localVideoInfo) ^
      const DeepCollectionEquality().hash(remoteVideoInfo);

  @override
  _$WebRtcStateCopyWith<_WebRtcState> get copyWith =>
      __$WebRtcStateCopyWithImpl<_WebRtcState>(this, _$identity);
}

abstract class _WebRtcState implements WebRtcState {
  const factory _WebRtcState(
      {VideoInfo localVideoInfo, VideoInfo remoteVideoInfo}) = _$_WebRtcState;

  @override
  VideoInfo get localVideoInfo;
  @override
  VideoInfo get remoteVideoInfo;
  @override
  _$WebRtcStateCopyWith<_WebRtcState> get copyWith;
}
