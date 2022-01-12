import 'package:flutter/material.dart';
import 'package:sistemas/pages/form_screen.dart';
import 'package:sistemas/pages/home_page.dart';

// ignore: prefer_const_constructors
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sistemas SSC',
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => const HomePage(),
          'form': (_) => const FormScreen(),
        });
  }
}
