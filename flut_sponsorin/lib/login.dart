import 'package:flut_sponsorin/company_view/discover_company.dart';
import 'package:flut_sponsorin/signup.dart';
import 'package:flut_sponsorin/sponsor_seeker_view/discover_sponsor.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  List<Map<String, dynamic>> list_user = [
    {'username': 'admin', 'password': 'qwerty', 'role': 'company'},
    {'username': 'petra', 'password': '12345', 'role': 'company'},
    {'username': 'irgl', 'password': '12345', 'role': 'sponsor'}
  ];

  final TextEditingController _tfUsername = TextEditingController();
  
  final TextEditingController _tfPassword = TextEditingController();

  void handle_login() {
    String username = _tfUsername.text;
    String password = _tfPassword.text;

    for (var user in list_user) {
      if (user['username'] == username && user['password'] == password) {
        if (user['role'] == 'company') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => discover_company()),
          );
        } else if (user['role'] == 'sponsor') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => discover_sponsor()),
          );
        }
        return;
      }
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Login Failed'),
        content: Text('Invalid username or password'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
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
                    Image(image: AssetImage('lib/assets/logo.png')),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        "Login",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: TextField(
                        controller: _tfUsername,
                        decoration: InputDecoration(
                          labelText: 'Email / phone numbers',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
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
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Don't have an account yet?"),
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
                              MaterialPageRoute(builder: (context) => signup()),
                            );
                          },
                          child: Text(
                            "Sign up here",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            handle_login();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff008037),
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text(
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
