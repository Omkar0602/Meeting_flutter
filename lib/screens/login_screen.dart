import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meetings_webster/resources/auth_methods.dart';
import 'package:meetings_webster/resources/jitsi.dart';
import 'package:meetings_webster/widget/custom_button.dart';
class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final AuthMethods _authMethods =AuthMethods();
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Start or join a meeting",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
          LottieBuilder.network("https://assets7.lottiefiles.com/private_files/lf30_jrhj68re.json"),
          CustomButton(text: 'Sign In', onPressed:()async{
            bool res  =await _authMethods.signInWIthGoogle(context);
            if(res){
              Navigator.pushNamed(context, '/home');
            }
          })
        ],
      ),
    );
  }
}