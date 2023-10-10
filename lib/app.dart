import 'package:banking_app/presentation/screens/main_page.dart'; 
import 'package:banking_app/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
class BankingApp extends StatelessWidget {
  final Future<bool> isFirstOpen;
  const BankingApp({Key? key, required this.isFirstOpen}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: isFirstOpen,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          final bool isFirstOpen = snapshot.data ?? false; 
          if (isFirstOpen) {
            return MaterialApp(
              home: MainPage(),
              debugShowCheckedModeBanner: false,
            );
          } else {
            return MaterialApp(
              home: SplashPage(),
              debugShowCheckedModeBanner: false,
            );
          }
        }
      },
    );
  }
}
