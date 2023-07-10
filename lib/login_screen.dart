import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences/home_screen.dart';
import 'package:sharedpreferences/student_screen.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<String> list = <String>['student', 'teacher', 'admin'];
  String userType = "student";
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var ageController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: userType,
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  userType = newValue!;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: "email"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: "Password"),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: ageController,
              decoration: const InputDecoration(hintText: "age"),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();

                sp.setString('email', emailController.text.toString());
                sp.setString('age', ageController.text.toString());
                sp.setString('userType', userType);
                sp.setBool('isLogin', true);

                var type = sp.get('userType');

                setState(() {
                  if(type == 'student'){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StudentView()));
                  }else if(type == 'teacher'){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  }else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  }
                });
              },
              child: Container(
                width: double.infinity,
                height: 40,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
