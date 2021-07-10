import 'package:flutter/material.dart';
import 'package:meow_too/global/global.parameters.dart';
import 'package:meow_too/widgets/drawer.header.widget.dart';
import 'package:meow_too/widgets/drawer.item.widget.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Drawer(
        child: ListView(
          children: [
           MyDrawerHeaderWidget(),
            ...(GlobalParameters.menu).map((item) =>
              DrawerItemWidget(item['title'] as String, item['route'] as String, item['icon'] as Icon)
            )
          ],
        ),
    );
  }
}
