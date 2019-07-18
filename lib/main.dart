import 'package:flutter/material.dart';

import 'package:local_push_carlin/src/providers/push_notification_providers.dart';

import 'package:local_push_carlin/src/pages/home_page.dart';
import 'package:local_push_carlin/src/pages/mensaje_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    final pushProvider = PushNotificationProviders();

    pushProvider.initNotifications();

    pushProvider.mensajes.listen((data){

      print('Data============');
      print(data);

      navigatorKey.currentState.pushNamed('mensaje', arguments: data);

      FocusScope.of(context).requestFocus(new FocusNode());
      _scaffoldKey.currentState?.removeCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text(
          'value',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontFamily: "WorkSansSemiBold"),
        ),
        backgroundColor: Colors.blue,
        duration: Duration(seconds: 3),
      ));
  

    });

  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      key: _scaffoldKey,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Push App',
      initialRoute: 'home',
      routes: {
        'home'    : (BuildContext context) => HomePage(),
        'mensaje' : (BuildContext context) => MensajePage()
      },
    );
  }
}