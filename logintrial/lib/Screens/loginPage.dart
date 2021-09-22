import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logintrial/Constants/Widgets.dart';
import 'package:get/get.dart';
import 'SignupPage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  late String emailId, pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'LOGIN',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              formTextField(
                inputType: TextInputType.emailAddress,
                Value: (val) {
                  emailId = val;
                },
                hintText: 'Email-Id',
              ),
              SizedBox(
                height: 20,
              ),
              formPasswordField(
                onChange: (val) {
                  pass = val;
                },
                Texthint: 'Password',
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: emailId, password: pass);
                    if (user != null) {
                      Navigator.pushNamed(context, 'home');
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    showSpinner = false;
                    if (e.toString() ==
                        '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.')
                      Get.snackbar("", "Please signUp",
                          snackPosition: SnackPosition.BOTTOM,
                          colorText: Colors.black,
                          snackStyle: SnackStyle.FLOATING,
                          maxWidth: MediaQuery.of(context).size.width,
                          backgroundColor: Colors.transparent);
                    if (e.toString() ==
                        '[firebase_auth/weak-password] Password should be at least 6 characters')
                      Get.snackbar(
                          "", "Password to should be of atleast 6 words",
                          snackPosition: SnackPosition.BOTTOM,
                          colorText: Colors.black,
                          snackStyle: SnackStyle.FLOATING,
                          maxWidth: MediaQuery.of(context).size.width,
                          backgroundColor: Colors.transparent);
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(SignUp());
                  // Navigator.pushNamed(context, 'signup');
                },
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Don\'t have an account? SignUp',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void validate(String id, String pass) {}
}
