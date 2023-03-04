import 'package:flutter/material.dart';
import 'package:flutter_zoom_clone/resources/auth_methods.dart';
import 'package:flutter_zoom_clone/screens/history_meetings_screen.dart';
import 'package:flutter_zoom_clone/screens/meetings_screen.dart';
import 'package:flutter_zoom_clone/utils/colors.dart';
import 'package:flutter_zoom_clone/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    MeetingsScreen(),
    const HistoryMeetingsScreen(),
    const Center(
      child: Text("Contacts"),
    ),
    Center(
        child: CustomButton(
            text: "Sign Out", onPressed: () => AuthMethods().signOut())),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Meet & Chat"),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: pages[_page],
      ),
      bottomNavigationBar: SizedBox(
        height: 75,
        child: BottomNavigationBar(
          showUnselectedLabels: false,
          backgroundColor: footerColor,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          currentIndex: _page,
          onTap: onPageChanged,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank),
              label: "Meet & Chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock),
              label: "Meetings",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: "Contacts",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
