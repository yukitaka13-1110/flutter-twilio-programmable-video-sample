import 'package:flutter/material.dart';

@immutable
class VideoInfo {
  const VideoInfo({this.id, this.widget});

  final String id;
  final Widget widget;
}
