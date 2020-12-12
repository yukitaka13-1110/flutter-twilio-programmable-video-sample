import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twilioSample/models/models.dart';

final webRtcController = StateNotifierProvider.autoDispose(
  (_) => WebRtcController(),
);
