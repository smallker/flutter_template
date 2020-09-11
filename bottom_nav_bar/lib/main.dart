import 'package:flutter/material.dart';
import 'package:flutter_template/views/menu_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:load/load.dart';

void main() {
  runApp(LoadingProvider(child: MainApp()));
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.poppinsTextTheme()),
      home: MenuPage(),
    );
  }
}
