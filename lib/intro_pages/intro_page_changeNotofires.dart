import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_e_state_project/intro_pages/intro_screen.dart';
import 'package:real_e_state_project/intro_pages/intro_screen_provider.dart';

class IntroPagesChnageNotifires extends StatelessWidget {
  const IntroPagesChnageNotifires({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => IntroScreenProvider(),
        child: IntroScreen()
    );
  }
}
