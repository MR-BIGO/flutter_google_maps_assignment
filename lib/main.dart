import 'package:flutter/material.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "7 WONDERS",
      initialRoute: "/home",
      routes: {
        "/home": (context) => HomeScreen(),
        "/details": (context) => const DetailsScreen(),
      },
    );
  }
}
