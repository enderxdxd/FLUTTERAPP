import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_signup/screens/HomeScreen.dart';
import 'package:login_signup/screens/welcome_screen.dart';
import 'package:login_signup/theme/theme.dart';  // Verify the correct path
import 'models/movie_model.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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


