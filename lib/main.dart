import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'DashBoardHomePage.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jivandan',
      theme: ThemeData(
        primarySwatch: Colors.purple,
         textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: DashBoardHome(),
    );
  }
}
