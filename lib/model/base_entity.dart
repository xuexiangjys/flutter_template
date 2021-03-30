/*
 * @Author: Nathaniel
 * @Date: 2021-03-25 17:16:29
 */
import 'entity_factory.dart';

class BaseEntity<T> {
  int code;
  String message;
  T data;

  BaseEntity({this.code, this.message, this.data});

  factory BaseEntity.fromJson(json) {
    return BaseEntity(
        code: json["code"],
        message: json["message"],
        data: EntityFactory.generateObject(json["data"]));
  }
}
