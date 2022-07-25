import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meetings_webster/resources/auth_methods.dart';
import 'package:meetings_webster/screens/home_screens.dart';
import 'package:meetings_webster/screens/join_screen.dart';
import 'package:meetings_webster/screens/login_screen.dart';
import 'package:meetings_webster/util/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meeting App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login':(context) => const LogInScreen(),
        '/home':(context) => const HomeScreen(),
        '/join-screen':(context) => JoinScreen(),
      },
      home:  StreamBuilder(
          stream: AuthMethods().authChanges,
        builder:(context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
            
            }
            if(snapshot.hasData){
              return HomeScreen();
            }
            return const LogInScreen();
        } ), 
      
    );
  }
}

