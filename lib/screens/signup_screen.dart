import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:login_signup/screens/signin_screen.dart';
import 'package:login_signup/theme/theme.dart';
import 'package:login_signup/widgets/custom_scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';
import 'home_screen.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formSignupKey = GlobalKey<FormState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  bool _agreePersonalData = true;
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> registerWithEmailAndPassword() async {
    if (!_formSignupKey.currentState!.validate() || !_agreePersonalData) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please make sure all fields are filled and agreement checked')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await Auth().createUserWithEmailandPassword(
        email: _controllerEmail.text.trim(),
        password: _controllerPassword.text.trim(),
      );
      // Navigate to home screen or next appropriate screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen())); // Assuming HomeScreen is your landing page after sign-up
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }

    if (_errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(_errorMessage!))
      );
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
                key: _formSignupKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _controllerEmail,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _controllerPassword,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: 'Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: _agreePersonalData,
                          onChanged: (bool? value) {
                            setState(() {
                              _agreePersonalData = value!;
                            });
                          },
                        ),
                        const Expanded(child: Text('I agree to the processing of my personal data.')),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: _isLoading ? null : registerWithEmailAndPassword,
                      child: _isLoading ? const CircularProgressIndicator(color: Colors.white) : const Text('Sign Up'),
                    ),
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
