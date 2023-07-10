import 'package:flutter/material.dart';

class ABC extends StatefulWidget {
  const ABC({Key? key}) : super(key: key);

  @override
  _ABCState createState() => _ABCState();
}

class _ABCState extends State<ABC> {
  @override
  var counter = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("you have pressed $counter")),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            counter++;
          });
        },
      ),
    );
  }
}
