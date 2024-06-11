import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/screens/welcome_screen.dart';
import '../screens/signin_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/task_list_screen.dart';
import '../theme/theme.dart';

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
      theme: lightMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/signin': (context) => const SignInScreen(),
        '/register': (context) => const SignUpScreen(),
        '/taskList': (context) => const TaskListScreen(),
      },
    );
  }
}
