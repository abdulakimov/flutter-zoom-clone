import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/resources/firestor_methods.dart';
import 'package:intl/intl.dart';

class HistoryMeetingsScreen extends StatelessWidget {
  const HistoryMeetingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreMethods().meetingsHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                'Room Name: ${snapshot.data!.docs[index]['meetingName']}',
              ),
              subtitle: Text(
                'Joined At: ${DateFormat('dd-MM-yyyy hh:mm a').format((snapshot.data!.docs[index]['timestamp'] as dynamic).toDate())}',
              ),
            );
          },
        );
      },
    );
  }
}
