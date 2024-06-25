import 'package:flut_sponsorin/company_view/discover_company.dart';
import 'package:flut_sponsorin/signup.dart';
import 'package:flut_sponsorin/sponsor_seeker_view/discover_sponsor.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'models/user.dart';
import 'globals.dart' as globals;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _tfPhoneOrEmail = TextEditingController();
  final TextEditingController _tfPassword = TextEditingController();
  late Box<User> userBox;

  void handleLogin() async {
    String phoneOrEmail = _tfPhoneOrEmail.text;
    String password = _tfPassword.text;

    userBox = Hive.box<User>('userBox');
    bool loginSuccessful = false;
    String? role;

    for (var key in userBox.keys) {
      var user = userBox.get(key) as User;

      if ((user.email == phoneOrEmail || user.phone == phoneOrEmail) && user.password == password) {
        loginSuccessful = true;
        role = user.role;
        globals.loggedInUser = user;
        break;
      }
    }

    if (loginSuccessful) {
      if (role == 'sponsor') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const discover_company()),
        );
      } else if (role == 'seeker') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const discover_event()),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Failed'),
          content: const Text('Invalid Credentials or Password'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/startupandroid.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Image(image: AssetImage('lib/assets/logo.png')),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextField(
                        controller: _tfPhoneOrEmail,
                        decoration: InputDecoration(
                          labelText: 'Email / Phone',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextField(
                        controller: _tfPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Don't Have an Account?"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const signup()),
                            );
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: handleLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff008037),
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: const Text(
                            'Next',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
