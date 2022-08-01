import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meetings_webster/resources/jitsi.dart';
import 'package:meetings_webster/resources/jitsiJoin.dart';
import 'package:meetings_webster/widget/home_meeting_button.dart';
class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);
 final JitsiJoin _jitsiJoin =JitsiJoin();
AuthMethods _authMethods =AuthMethods();
 createNewMeeting()async{
  var random =Random();
  String room =(random.nextInt(10000000)+10000000).toString();
  _jitsiJoin.joinMeeting(room: room, isAudioOn: false, isVideoOn: false, userName: _authMethods.user.displayName!;
 }

 joinMeeting(BuildContext context){
  Navigator.pushNamed(context, '/join-screen');
 }

  @override
  Widget build(BuildContext context) {
    return Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
     
        
        
          
          HomeMeetingButton(onPressed: (){
            createNewMeeting();
          },text: 'New Meeting',icon: Icons.videocam,),
          
          HomeMeetingButton(onPressed: ()=>joinMeeting(context),text: 'Join Meeting',icon: Icons.add_box_rounded),
           
          HomeMeetingButton(onPressed: (){},text: 'Schedule',icon: Icons.calendar_today),
           
          HomeMeetingButton(onPressed: (){},text: 'Share Screen',icon: Icons.arrow_upward_rounded),

        
      
      Expanded(child: Center(child: Text("Create or Join Meetings",style: const TextStyle(fontSize: 18,color: Colors.grey),),))

    ],
    );
  }
}
