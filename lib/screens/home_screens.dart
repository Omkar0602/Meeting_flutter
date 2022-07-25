import 'package:flutter/material.dart';
import 'package:meetings_webster/resources/auth_methods.dart';
import 'package:meetings_webster/screens/history_screen.dart';
import 'package:meetings_webster/screens/meeting_screen.dart';
import 'package:meetings_webster/util/colors.dart';
import 'package:meetings_webster/widget/custom_button.dart';
import 'package:meetings_webster/widget/home_meeting_button.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page=0;
  onPressed(int page){
    setState(() {
      _page =page;
    });
  }
  List<Widget> pages =[
     MeetingScreen(),
    const HistoryScreen(),
    const Text('contacts'),
    CustomButton(text: "LogOut", onPressed: ()=>AuthMethods().signOut()),
  ];
  @override
  Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const  Text('Meet App'),
        centerTitle:  true,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPressed,
        currentIndex: _page,
        items: 
      const [
        BottomNavigationBarItem(icon: Icon(Icons.comment_bank),label: 'Meet & chat'),
        BottomNavigationBarItem(icon: Icon(Icons.lock_clock),label: 'Meetings'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: 'Contacts'),
        BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),label: 'Settings')
      ]),
    );
  }
}

