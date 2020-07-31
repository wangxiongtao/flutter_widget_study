import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// 创建时间：2020/7/31 
/// 作者：Dawn

class ToastUtil {
  static void toast(msg){
    Fluttertoast.showToast(msg:msg);
  }
}