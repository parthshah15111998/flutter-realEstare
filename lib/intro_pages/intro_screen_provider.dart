import 'package:flutter/cupertino.dart';

class IntroScreenProvider with ChangeNotifier{

  int number = 0;

  void introPagesCount(int value) {
    number = value;
    notifyListeners();
  }


}