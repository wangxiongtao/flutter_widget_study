import 'package:flutter/material.dart';

/// 创建时间：2020/8/7 
/// 作者：Dawn

class ShowCount extends ChangeNotifier {
  int count = 0;
  void increment() {
    count++;
    notifyListeners();
  }
}