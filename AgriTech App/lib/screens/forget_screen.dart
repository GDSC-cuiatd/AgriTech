import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/custom_textfield.dart';

class ForgetScreen extends StatefulWidget {
  @override
  _ForgetScreenState createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  bool _isLoading = false;
  void _submit() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      print('Forget save');
      try {
        setState(() {
          _isLoading = true;
        });
        String email = emailController.text.trim();
        resetPassword(email);
        emailController.clear();
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to forget: $e'),
        ));
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
      // Validation passed, handle login
      print('Email: ${emailController.text}');
      // Here you would perform the login logic, such as calling an API
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Password reset sent successfully to $email'),
          backgroundColor: Colors.green));
      // Password reset email sent successfully
    } catch (e) {
      // Error occurred, handle accordingly
      print('Failed to send password reset email: $e');
      if(mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to send password reset email: $e'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Forget Password',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  'Please enter your email account',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 100),
                CustomTextField(
                  labelText: 'Email',
                  controller: emailController,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email.';
                    } else if (!(value.contains('@') && value.contains('.'))) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                _isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        onPressed: _isLoading ? null : _submit,
                        child: Text('Forget'),
                      ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
