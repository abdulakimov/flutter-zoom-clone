import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/resources/jitsi_meet_methods.dart';
import 'package:flutter_zoom_clone/widgets/icon_buttons.dart';

class MeetingsScreen extends StatelessWidget {
  MeetingsScreen({super.key});

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  createNewMeeting() {
    var random = Random();
    var roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
      roomName: roomName,
      isAudioMuted: true,
      isVideoMuted: true,
    );
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, 'video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButtons(
              onPressed: createNewMeeting,
              icon: Icons.videocam,
              text: 'New Meeting',
            ),
            IconButtons(
              onPressed: () => joinMeeting(context),
              icon: Icons.add_box_rounded,
              text: 'Join Meeting',
            ),
            IconButtons(
              onPressed: () {},
              icon: Icons.calendar_today,
              text: 'Schedule',
            ),
            IconButtons(
              onPressed: () {},
              icon: Icons.arrow_upward_rounded,
              text: 'Share Screen',
            ),
          ],
        ),
        const Expanded(
          child: Center(
            child: Text(
              "Create or Join Meetings with just a click",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
