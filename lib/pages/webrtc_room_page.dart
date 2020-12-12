import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twilioSample/states/state_providers.dart';

class WebRtcRoomPage extends ConsumerWidget {
  const WebRtcRoomPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final controller = watch(webRtcController);
    final state = watch(webRtcController.state);

    return Scaffold(
      appBar: null,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _videoWidget(context, state.localVideoInfo.widget),
          _videoWidget(context, state.remoteVideoInfo.widget),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await controller.endCall();
          Navigator.of(context)?.pop();
        },
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.call_end,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _videoWidget(BuildContext context, Widget widget) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    if (widget == null) {
      return Placeholder(
        fallbackWidth: width,
        fallbackHeight: height / 2.0,
      );
    }

    return SizedBox(
      width: width,
      height: height / 2.0,
      child: widget,
    );
  }
}
