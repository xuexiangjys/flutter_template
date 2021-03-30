/*
 * @Author: Nathaniel
 * @Date: 2021-03-25 17:27:04
 */
import 'entity_factory.dart';

class ListEntity<T> {
  int code;
  String message;
  List<T> data;

  ListEntity({this.code, this.message, this.data});

  factory ListEntity.fromJson(json) {
    List<T> mData = List();
    if (json['data'] != null) {
      (json['data'] as List).forEach((v) {
        mData.add(EntityFactory.generateObject(json)<T>(v));
      });
    }

    return ListEntity(
      code: json["code"],
      message: json["msg"],
      data: mData,
    );
  }
}
