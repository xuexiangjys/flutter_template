/*
 * @Author: Nathaniel
 * @Date: 2021-03-30 15:33:48
 */
import 'package:dio/dio.dart';
import 'package:flutter_template/model/error_entity.dart';

class ErrorHandler {
  static ErrorEntity handleError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        return ErrorEntity(code: -1, message: "请求取消");
        break;
      case DioErrorType.connectTimeout:
        return ErrorEntity(code: -1, message: "连接超时");
        break;
      case DioErrorType.sendTimeout:
        return ErrorEntity(code: -1, message: "请求超时");

        break;
      case DioErrorType.receiveTimeout:
        return ErrorEntity(code: -1, message: "响应超时");
        break;
      case DioErrorType.response:
        try {
          int errCode = dioError.response.statusCode;
          String errMsg = dioError.response.statusMessage;
          switch (errCode) {
            case 400:
              return ErrorEntity(code: errCode, message: "请求语法错误");
              break;
            case 403:
              return ErrorEntity(code: errCode, message: "服务器拒绝执行");
              break;
            case 404:
              return ErrorEntity(code: errCode, message: "无法连接服务器");

              break;
            case 405:
              return ErrorEntity(code: errCode, message: "请求方法被禁止");
              break;
            case 500:
              return ErrorEntity(code: errCode, message: "服务器内部错误");

              break;
            case 502:
              return ErrorEntity(code: errCode, message: "无效的请求");

              break;
            case 503:
              return ErrorEntity(code: errCode, message: "服务器挂了");

              break;
            case 505:
              return ErrorEntity(code: errCode, message: "不支持HTTP协议请求");
              break;
            default:
              return ErrorEntity(code: errCode, message: errMsg);
          }
        } on Exception catch (_) {
          return ErrorEntity(code: -1, message: "未知错误");
        }
        break;
      default:
        return ErrorEntity(code: -1, message: dioError.message);
    }
  }
}
