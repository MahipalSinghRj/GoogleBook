import 'package:flutter/material.dart';
import 'package:visibility/AboutPage.dart';
import 'GoogleBooks.dart';
import 'HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       initialRoute: "/",
       onGenerateRoute: (setting){
        Map<String, Widget> pages={
          "/":GoogleBooks(),
          "/AboutPage":AboutPage()
        };
        return MaterialPageRoute(builder: (childContext)=>pages[setting.name]!);
      },
     );
  }
}


