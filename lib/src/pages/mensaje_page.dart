import 'package:flutter/material.dart';

class MensajePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Mensaje page'),
      ),
      body: Center(
        child: Text('Argumento'),
      ),
    );
  }
}