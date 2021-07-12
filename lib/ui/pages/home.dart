import 'package:flutter/material.dart';
import 'package:meow_too/widgets/mydrawer.widget.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MeowToo"),
      ),
      drawer: MyDrawer(),
      body: Container(

      ),
    );
  }
}
