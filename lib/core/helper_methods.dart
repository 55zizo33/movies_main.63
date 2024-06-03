 import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
final navigatorKey = GlobalKey<NavigatorState>();
Future<dynamic>navigateTo(Widget page,{bool keepHistory=true})
{
 return Navigator.pushAndRemoveUntil(
    navigatorKey.currentContext!,
    MaterialPageRoute(
      builder: (context) => page,
    ),
        (route) => true,
  );
}
 enum MessageType {success , warning,error }
void showMessage(String msg,{MessageType messageType=MessageType.success}){
  ScaffoldMessenger.of(navigatorKey.currentContext!).
  showSnackBar(SnackBar(content:
  Text(msg),
    duration: Duration(seconds: 3),
    backgroundColor:messageType==MessageType.success
        ? Colors.green
        : messageType==MessageType.warning
        ? Colors.orange
        :Colors.red,
  ));
}
 Future<void> openUrl(String url)async{
  await launchUrl(Uri.parse("url"));
}