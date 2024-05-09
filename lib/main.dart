import 'package:flutter/material.dart';
import 'package:login_signup/screens/welcome_screen.dart';
<<<<<<< Updated upstream
import 'package:login_signup/theme/theme.dart';  // Path to this Firebase configuration file
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
=======
import 'package:login_signup/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
>>>>>>> Stashed changes
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode,
      home: const WelcomeScreen(),
    );
  }
}