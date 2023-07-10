import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences/home_screen.dart';
import 'package:sharedpreferences/login_screen.dart';
import 'package:sharedpreferences/student_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // ignore: prefer_typing_uninitialized_variables
  var logIn;
  var type = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();

  }
  @override

  isLogin ()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    logIn = sp.get('isLogin') ?? false;
    type = sp.get('userType').toString();

    if(logIn){
      if(type == 'student'){
        Timer(const Duration(seconds: 5), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const StudentView()));
        });} else if(type == 'teacher'){
        Timer(const Duration(seconds: 5), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        });
      }else{
        Timer(const Duration(seconds: 5), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        });
      }
    }else {
      Timer(const Duration(seconds: 5), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      });
    }
    }

  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fitHeight,
        image: NetworkImage('https://images.pexels.com/photos/16972129/pexels-photo-16972129/free-photo-of-ice-cream-on-stick-lying-on-a-potter-plate.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load'),
      ),
    );
  }
}
