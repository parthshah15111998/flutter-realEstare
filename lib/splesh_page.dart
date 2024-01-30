import 'package:flutter/material.dart';

class SpleshScreen extends StatelessWidget {
  const SpleshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Image.asset("assets/splesh_image.png",scale: 2.5),
          Image.asset("assets/logo.png",scale: 3,),
          const SizedBox(height:20,),
          SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                  textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              child: const Text('Get Started',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),),
            ),
          ),

        ],
      ),
    );
  }
}
