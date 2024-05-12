import 'package:flutter/material.dart';
import 'package:login_signup/widgets/custom_scaffold.dart';
import 'package:login_signup/screens/signin_screen.dart';
import 'package:login_signup/theme/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';
import 'HomeScreen.dart';

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
      // Navigate to home screen or next appropriate screen after successful registration
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => Home())); // Make sure you define HomeScreen
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                        color: lightColorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 40.0),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        hintText: 'Enter your full name',
                        hintStyle: TextStyle(color: Colors.black26),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.0),
                    TextFormField(
                      controller: _controllerEmail,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(color: Colors.black26),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.0),
                    TextFormField(
                      controller: _controllerPassword,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(color: Colors.black26),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Row(
                      children: [
                        Checkbox(
                          value: _agreePersonalData,
                          onChanged: (bool? value) {
                            setState(() {
                              _agreePersonalData = value!;
                            });
                          },
                          activeColor: lightColorScheme.primary,
                        ),
                        Expanded(
                          child: Text('I agree to the processing of my personal data.', style: TextStyle(color: Colors.black45)),
                        ),
                      ],
                    ),
                    SizedBox(height: 25.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : registerWithEmailAndPassword,
                        child: _isLoading ? CircularProgressIndicator(color: Colors.white) : Text('Register'),
                      ),
                    ),
                    SizedBox(height: 20.0),
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
 
                
          
                   

