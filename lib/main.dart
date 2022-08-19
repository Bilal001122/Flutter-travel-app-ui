import 'package:flutter/material.dart';
import 'package:travel_ui_app/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Travel UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF3EBACE),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Color(0xFFD8ECF1),
        ),
      ),
      home: NavScreen(),
    );
  }
}
