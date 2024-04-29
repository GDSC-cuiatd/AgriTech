import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../custom_widgets/custom_textfield.dart';
import '../widget/plant_recogniser.dart';
import 'auth-ui/signin_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _submit() async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      if (passwordController.text.length > 5) {
        form.save();
        setState(() {
          _isLoading = true;
        });
        try {
          QuerySnapshot querySnapshot = await FirebaseFirestore.instance
              .collection('users')
              .where('email', isEqualTo: emailController.text)
              .get();

          if (querySnapshot.docs.isNotEmpty) {
            print('Email is already registered!');
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Email is already registered!'),
            ));
            setState(() {
              _isLoading = false;
            });
            return;
          }

          UserCredential userCredential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );

          await FirebaseFirestore.instance
              .collection('users')
              .doc(userCredential.user!.uid)
              .set({
            'name': nameController.text,
            'email': emailController.text,
            'phone': phoneController.text,
            'address': '',
          });

          print('User signed up successfully!');
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('User signed up successfully!'),
            ));
          }
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => SignInScreen(),
            ),
          );
        } on FirebaseAuthException catch (e) {
          print('FirebaseAuthException: ${e.message}');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('FirebaseAuthException: ${e.message}'),
          ));
        } catch (e) {
          print('Error signing up: $e');
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Failed to sign up with email and password: $e'),
          ));
        } finally {
          setState(() {
            _isLoading = false;
          });
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Password should be at least 6 characters long'),
          ),
        );
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
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Register',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Create your account',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      labelText: 'Name',
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Email',
                      controller: emailController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email.';
                        } else if (!(value.contains('@') &&
                            value.contains('.'))) {
                          return 'Invalid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Phone',
                      controller: phoneController,
                      validator: (value) {
                        // Regular expression for Pakistani phone number
                        RegExp pakistanPhoneRegExp =
                            RegExp(r'^\+?92[0-9]{10}$');

                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        } else if (!pakistanPhoneRegExp.hasMatch(value)) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Password',
                      controller: passwordController,
                      obscureText: _obscurePassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      labelText: 'Confirm Password',
                      controller: confirmPasswordController,
                      obscureText: _obscureConfirmPassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                        icon: Icon(
                          _obscureConfirmPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password.';
                        } else if (value != passwordController.text) {
                          return "Password doesn't match.";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    _isLoading
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: _isLoading ? null : _submit,
                            child: Text('Sign Up'),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
