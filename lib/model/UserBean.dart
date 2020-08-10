import 'package:json_annotation/json_annotation.dart';


/// 创建时间：2020/8/7 
/// 作者：Dawn
///




class UseBean{
  UseBean(this.name, this.email);

  String name;
  String email;
  //不同的类使用不同的mixin即可
//  factory UseBean.fromJson(Map<String, dynamic> json) => _$UseBeanFromJson(json);
//  Map<String, dynamic> toJson() => _$UseBeanToJson(this);
@override
  bool operator ==(Object other) {
    // TODO: implement ==
  print("UseBean===operator==");
    return this.email==(other as UseBean).email;
  }



}

