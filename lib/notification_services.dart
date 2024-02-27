import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationServices{

  FirebaseMessaging messaging= FirebaseMessaging.instance;

 Future<void> requestNotificationPermission() async {

    NotificationSettings settings= await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true, //indicators shown on app icon
      criticalAlert: true,
      carPlay: true,
      sound: true,
      provisional: true //options available to user to turn on or off notifications
    );

    if(settings.authorizationStatus== AuthorizationStatus.authorized){

      print("User granted permission");

    }
    else if(settings.authorizationStatus== AuthorizationStatus.provisional){

      print("User granted provisional permission");

    }
    else{
      print("User denied permission");
    }
  }

 Future<String> getDeviceToken() async{
   String? token = await messaging.getToken(); //notification on device token
   return token!;
 }
}