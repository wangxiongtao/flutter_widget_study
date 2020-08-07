import 'package:json_annotation/json_annotation.dart';


/// 创建时间：2020/8/7 
/// 作者：Dawn
///


///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()

class UseBean{
  UseBean(this.name, this.email);

  String name;
  String email;
  //不同的类使用不同的mixin即可
//  factory UseBean.fromJson(Map<String, dynamic> json) => _$UseBeanFromJson(json);
//  Map<String, dynamic> toJson() => _$UseBeanToJson(this);
}