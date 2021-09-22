import 'package:flutter/material.dart';
import 'Screens/loginPage.dart';
import 'Screens/SignupPage.dart';
import 'Screens/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: 'login',
      debugShowCheckedModeBanner: false,
      routes: {
        'login': (context) => Login(),
        'signup': (context) => SignUp(),
        'home': (context) => Home()
      },
    );
  }
}
