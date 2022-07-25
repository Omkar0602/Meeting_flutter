import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreMethods{
  final FirebaseFirestore _firestore =FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth =FirebaseAuth.instance;
      Stream get meetingsHistory =>_firestore.collection('users').doc(_firebaseAuth.currentUser!.uid).collection('meetings').snapshots();

  void addToMeetingHistory(String meetingname)async{
      try{
        await _firestore.collection('users').doc(_firebaseAuth.currentUser!.uid).collection('meetings').add({
          'meetingName':meetingname,
          'createdAt':DateTime.now(),
        });
      }
      catch(e){
         print(e);
      }
  }
}