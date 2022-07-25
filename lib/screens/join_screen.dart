import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:meetings_webster/resources/auth_methods.dart';
import 'package:meetings_webster/resources/jitsiJoin.dart';
import 'package:meetings_webster/util/colors.dart';
import 'package:meetings_webster/widget/meeting_option.dart';

class JoinScreen extends StatefulWidget {
  const JoinScreen({Key? key}) : super(key: key);

  @override
  State<JoinScreen> createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
   onAudioMuted(bool val){
setState(() {
  isAudioMuted=val;
});
    }
    onVideoMuted(bool val){
setState(() {
  isVideoMuted=val;
});
    }
  late TextEditingController meetingidcontroller ;
  late TextEditingController namecontroller ;
  AuthMethods _authMethods =AuthMethods();
  bool isAudioMuted=true;
  bool isVideoMuted=true;
  @override
  void dispose(){
    super.dispose();
    meetingidcontroller.dispose();
    namecontroller.dispose();
    
  }
  final JitsiJoin _jitsiJoin =JitsiJoin();
  joinMeeting(){
      _jitsiJoin.joinMeeting(room: meetingidcontroller.text, isAudioOn: isAudioMuted, isVideoOn: isVideoMuted,userName: namecontroller.text);
  }
  @override
  void initState() {
    meetingidcontroller =TextEditingController();
    namecontroller =TextEditingController(text:_authMethods.user.displayName );

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: backgroundColor,
        title: const Text("Join a meeting",style: TextStyle(fontSize: 18),)
        
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              
              controller:meetingidcontroller ,
            
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: "Room Id",
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
              ),

            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller:namecontroller ,
              maxLines: 1,
              textAlign: TextAlign.center,
              
              decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: "Name",
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 10)
              ),

            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: joinMeeting,
            child: const Padding(padding: EdgeInsets.all(8),child: Text("Join",style: TextStyle(fontSize: 16),),),
          ),
          SizedBox(height: 20,),
          MeetingOption(text: 'Don\'t join with Audio',
           onChange: onAudioMuted, mute: isAudioMuted,),
                    MeetingOption(text: 'Turn off video', onChange: onVideoMuted, mute: isVideoMuted,),

          
        ],
      ),
    );
   
    
  }
}