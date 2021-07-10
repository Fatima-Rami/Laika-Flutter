import 'package:flutter/material.dart';

class MyDrawerHeaderWidget extends StatelessWidget {
  const MyDrawerHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DrawerHeader(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.deepPurpleAccent, Colors.white])),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.lightGreen,
          )
        ],
      ),
    );
  }
}
