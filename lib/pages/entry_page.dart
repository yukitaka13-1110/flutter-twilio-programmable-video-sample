import 'package:flutter/material.dart';
import 'package:twilioSample/pages/webrtc_room_page.dart';

class EntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Twilio Sample'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Twilio VideoRoom',
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context)?.push<MaterialPageRoute>(
                    MaterialPageRoute(
                      builder: (context) {
                        return const WebRtcRoomPage();
                      },
                    ),
                  );
                },
                color: Theme.of(context).buttonColor,
                child: const Text('Enter'),
              ),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
