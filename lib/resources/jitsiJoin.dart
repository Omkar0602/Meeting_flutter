import 'package:flutter/material.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:meetings_webster/resources/auth_methods.dart';
import 'package:meetings_webster/resources/firestore_methods.dart';

class JitsiJoin{
  joinMeeting({required String room,required bool isAudioOn,required bool isVideoOn,String userName=''}) async {
    
    AuthMethods _authMethods =AuthMethods();
    final FirestoreMethods _firestore =FirestoreMethods();
    Map<FeatureFlag, Object> featureFlags = {};

    // Define meetings options here
    String name;
    if(userName.isEmpty){
   name=_authMethods.user.displayName!;
    }
    
    name=userName;
    _firestore.addToMeetingHistory(room);
    var options = JitsiMeetingOptions(
      roomNameOrUrl: room,
      
      
      isAudioMuted: isAudioOn,
      
      isVideoMuted: isVideoOn,
      userDisplayName: name,
      userEmail: _authMethods.user.email,
      featureFlags: featureFlags,
      
    );

    debugPrint("JitsiMeetingOptions: $options");
    await JitsiMeetWrapper.joinMeeting(
      options: options,
      listener: JitsiMeetingListener(
        onOpened: () => debugPrint("onOpened"),
        onConferenceWillJoin: (url) {
          debugPrint("onConferenceWillJoin: url: $url");
        },
        onConferenceJoined: (url) {
          debugPrint("onConferenceJoined: url: $url");
        },
        onConferenceTerminated: (url, error) {
          debugPrint("onConferenceTerminated: url: $url, error: $error");
        },
        onAudioMutedChanged: (isMuted) {
          debugPrint("onAudioMutedChanged: isMuted: $isMuted");
        },
        onVideoMutedChanged: (isMuted) {
          debugPrint("onVideoMutedChanged: isMuted: $isMuted");
        },
        onScreenShareToggled: (participantId, isSharing) {
          debugPrint(
            "onScreenShareToggled: participantId: $participantId, "
            "isSharing: $isSharing",
          );
        },
        onParticipantJoined: (email, name, role, participantId) {
          debugPrint(
            "onParticipantJoined: email: $email, name: $name, role: $role, "
            "participantId: $participantId",
          );
        },
        onParticipantLeft: (participantId) {
          debugPrint("onParticipantLeft: participantId: $participantId");
        },
        onParticipantsInfoRetrieved: (participantsInfo, requestId) {
          debugPrint(
            "onParticipantsInfoRetrieved: participantsInfo: $participantsInfo, "
            "requestId: $requestId",
          );
        },
        onChatMessageReceived: (senderId, message, isPrivate) {
          debugPrint(
            "onChatMessageReceived: senderId: $senderId, message: $message, "
            "isPrivate: $isPrivate",
          );
        },
        onChatToggled: (isOpen) => debugPrint("onChatToggled: isOpen: $isOpen"),
        onClosed: () => debugPrint("onClosed"),
      ),
    );
    
  }
}