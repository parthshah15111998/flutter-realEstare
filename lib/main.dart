import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_e_state_project/intro_pages/intro_page_changeNotofires.dart';
import 'package:real_e_state_project/intro_pages/intro_screen.dart';
import 'package:real_e_state_project/intro_pages/intro_screen_provider.dart';
import 'package:real_e_state_project/splesh_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPagesChnageNotifires()
    );
  }
}


