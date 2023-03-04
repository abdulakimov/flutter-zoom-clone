import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/resources/auth_methods.dart';
import 'package:flutter_zoom_clone/resources/jitsi_meet_methods.dart';
import 'package:flutter_zoom_clone/screens/meeting_options.dart';
import 'package:flutter_zoom_clone/utils/colors.dart';

class VideoCallsScreen extends StatefulWidget {
  const VideoCallsScreen({super.key});

  @override
  State<VideoCallsScreen> createState() => _VideoCallsScreenState();
}

class _VideoCallsScreenState extends State<VideoCallsScreen> {
  final AuthMethods _authMethods = AuthMethods();
  final JitsiMeetMethods _jitsiMeetWrapper = JitsiMeetMethods();
  late TextEditingController _roomIDController;
  late TextEditingController _nameUserController;

  bool isAudioMuted = true;
  bool isVideoMuted = true;

  @override
  void initState() {
    super.initState();
    _roomIDController = TextEditingController();
    _nameUserController =
        TextEditingController(text: _authMethods.user.displayName);
  }

  @override
  void dispose() {
    _roomIDController.dispose();
    _nameUserController.dispose();
    super.dispose();
  }

  _joinMeeting() {
    _jitsiMeetWrapper.createMeeting(
      roomName: _roomIDController.text,
      nameUser: _nameUserController.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text(
          "Join a Meeting",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: _roomIDController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: "Room ID",
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: _nameUserController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: "Name",
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: _joinMeeting,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Join Meeting",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MeetingOptions(
            text: "Mute Audio",
            isMuted: isAudioMuted,
            onChanged: onAudioChanged,
          ),
          MeetingOptions(
            text: "Turn off Video",
            isMuted: isVideoMuted,
            onChanged: onVideoChanged,
          ),
        ],
      ),
    );
  }

  void onAudioChanged(bool value) {
    setState(() {
      isAudioMuted = value;
    });
  }

  void onVideoChanged(bool value) {
    setState(() {
      isVideoMuted = value;
    });
  }
}
