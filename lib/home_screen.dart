import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences/login_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String email = '';
  String age = '';
  String type = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.get('email').toString();
    age = sp.get('age').toString();
    type = sp.get('userType').toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("HomePage"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("email"),
                  Text(email),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("age"),
                  Text(age),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("userType"),
                  Text(type),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();

                  sp.clear();

                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const LoginPage())));
                  });
                },
                child: Container(
                  width: double.infinity,
                  height: 40,
                  color: Colors.blue,
                  child: const Center(child: Text("Logout")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
