import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:login_signup/screens/welcome_screen.dart';
<<<<<<< Updated upstream
import 'package:login_signup/theme/theme.dart';  // Path to this Firebase configuration file
=======
>>>>>>> 2c0a7ae9074589cead4fe97ac44a0dafd931f2e0
import 'package:firebase_core/firebase_core.dart';
import 'package:login_signup/screens/HomeScreen.dart';
import 'package:login_signup/screens/welcome_screen.dart';
import 'package:login_signup/theme/theme.dart';  // Verify the correct path
import 'models/movie_model.dart';


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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode,  // Assuming lightMode is defined in your theme file
      home: WelcomeScreen(),  // Starting screen of your app
      routes: {
        '/movieExplorer': (context) => Home(),  // Route to the movie explorer
      },
    );
  }
}


