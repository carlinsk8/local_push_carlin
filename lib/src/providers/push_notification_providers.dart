import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';


class PushNotificationProviders {

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _mensajeStreamController =  StreamController<String>.broadcast();
  Stream<String> get mensajes => _mensajeStreamController.stream;

  initNotifications(){

    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.getToken().then((token) {

      print('======FCM Token ======');
      print(token);

      //eOSAXoqhbKE:APA91bF-yTXEJ_PJL9JX_yKmokC7rEmX2Y9vNdkhgqP5-aB8ydnO0lN25jt5uGExj10hHCn00PNpU-3SBAshnz4fZtJmzwT9i7Pnkp78RauhDA4GJ4gHpIhbjBtzPiP7dKgbX63VitGf

    });

    _firebaseMessaging.configure(

      onMessage: ( info ) {

        print('====== On Message ======');
        print(info);

        String argumento = 'no-data';
        if ( Platform.isAndroid ){
          argumento = info['data']['comida'] ?? 'no-data';
        }

        _mensajeStreamController.sink.add(argumento);
        
        return;
      },
      onLaunch: ( info ) {

        print('====== On Launch ======');
        print(info);
        return;
      },
      onResume: ( info ) {

        print('====== On Resume ======');
        print(info);
        return;
      }

    );

  }

  dispose() {
    _mensajeStreamController.close();
  }
}