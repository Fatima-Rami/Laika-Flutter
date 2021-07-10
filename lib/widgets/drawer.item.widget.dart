import 'package:flutter/material.dart';

class DrawerItemWidget extends StatelessWidget {

  String itemTitle;
  String route;
  Icon icon;

  DrawerItemWidget(this.itemTitle, this.route, this.icon);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, this.route);
      },
      leading: this.icon,
      trailing: Icon(Icons.arrow_right, color: Colors.deepPurpleAccent),
      title: Text(itemTitle),
    );
  }
}
