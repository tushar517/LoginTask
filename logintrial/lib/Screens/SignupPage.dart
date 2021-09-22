import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logintrial/Constants/Widgets.dart';
import 'package:get/get.dart';
import 'package:logintrial/Screens/HomePage.dart';
import 'package:logintrial/Screens/loginPage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
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
              'SIGNUP',
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
                print(pass);
              },
              Texthint: 'Password',
            ),
            SizedBox(
              height: 20,
            ),
            formPasswordField(
              onChange: (val) {
                pass = val;
                print(pass);
              },
              Texthint: 'Confirm Password',
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
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: emailId, password: pass);
                  if (newUser != null) {
                    Get.to(Home());
                  }
                  setState(() {
                    showSpinner = false;
                  });
                } catch (e) {
                  showSpinner = false;
                  if (e.toString() ==
                      '[firebase_auth/weak-password] Password should be at least 6 characters')
                    Get.snackbar("", "Password to should be of atleast 6 words",
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
                  'REGISTER',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Get.to(Login());
                // Navigator.pushNamed(context, 'signup');
              },
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  'Already have an account? Login',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
