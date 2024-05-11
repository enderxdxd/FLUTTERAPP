import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/screens/HomeScreen.dart'; // Ensure you have a HomeScreen to navigate to
import 'package:login_signup/widgets/custom_scaffold.dart';
import 'package:login_signup/theme/theme.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formSignInKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool rememberPassword = true;
  bool _isLoading = false;

  Future<void> signInWithEmailAndPassword() async {
    if (!_formSignInKey.currentState!.validate()) {
      // If the form isn't valid, show a snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out the form correctly')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Attempt to sign in the user
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Navigate to HomeScreen on success
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Failed to sign in';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formSignInKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
                    
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        label: Text('Email'),
                        hintText: 'Enter your email',
                      ),
                      validator: (value) => value != null && value.isNotEmpty && value.contains('@') ? null : 'Enter a valid email',
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text('Password'),
                        hintText: 'Enter your password',
                      ),
                      validator: (value) => value != null && value.isNotEmpty ? null : 'Enter a password',
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _isLoading ? null : signInWithEmailAndPassword,
                      child: _isLoading ? CircularProgressIndicator(color: Colors.white) : Text('Sign In'),
                    ),
                    // Other widgets remain unchanged
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
