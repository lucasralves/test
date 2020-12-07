import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'menu_controller.dart';

class MenuPage extends StatefulWidget {
  final String title;
  const MenuPage({Key key, this.title = "Menu"}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends ModularState<MenuPage, MenuController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
