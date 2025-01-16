import 'package:chat_app/ui/screens/logIn.dart';
import 'package:chat_app/ui/screens/register.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LogInScreen.routeName : (context) => LogInScreen(),
        RegisterScreen.routeName : (context) => RegisterScreen(),
      },
      initialRoute: LogInScreen.routeName,
    );
  }
}
