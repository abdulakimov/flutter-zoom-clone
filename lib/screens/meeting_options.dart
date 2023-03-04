import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/utils/colors.dart';

class MeetingOptions extends StatelessWidget {
  final String text;
  final bool isMuted;
  final Function(bool) onChanged;
  const MeetingOptions({
    super.key,
    required this.text,
    required this.isMuted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          CupertinoSwitch(value: isMuted, onChanged: onChanged)
        ],
      ),
    );
  }
}
