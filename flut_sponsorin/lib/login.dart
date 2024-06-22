import 'package:flut_sponsorin/company_view/discover_company.dart';
import 'package:flut_sponsorin/signup.dart';
import 'package:flut_sponsorin/sponsor_seeker_view/discover_sponsor.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'models/user.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _tfPhoneOrEmail = TextEditingController();
  final TextEditingController _tfPassword = TextEditingController();
  late Box<User> userBox;

  void handle_login() async {
    String emailOrPhone = _tfPhoneOrEmail.text;
    String password = _tfPassword.text;

    userBox = Hive.box<User>('userBox');
    bool loginSuccess = false;

    for (var key in userBox.keys) {
      var user = userBox.get(key) as User;

      if ((user.email == emailOrPhone || user.phone == emailOrPhone) && user.password == password) {
        loginSuccess = true;

        if (user.role == 'sponsor') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => discover_event()),
          );
        } else if (user.role == 'seeker') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => discover_company()),
          );
        }

        break;
      }
    }

    if (!loginSuccess) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Invalid Credentials or Password'),
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
                controller: _tfPhoneOrEmail,
                decoration: InputDecoration(
                  labelText: 'Email / Phone Number',
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => signup()));
                  },
                  child: Text(
                    "Don't Have an Account? Sign Up Here",
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
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
