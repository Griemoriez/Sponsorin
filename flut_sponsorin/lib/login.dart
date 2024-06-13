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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _tfUsername,
                decoration: InputDecoration(
                  labelText: 'Email / phone numbers',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _tfPassword,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => signup()));
                  },
                  child: Text(
                    "Don't have an account? sign up here",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  handle_login();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text('next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
