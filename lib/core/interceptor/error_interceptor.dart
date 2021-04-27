/*
 * @Author: Nathaniel
 * @Date: 2021-03-30 15:57:50
 */

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_template/core/global_constant.dart';

/// Dio OnError 拦截器
class ErrorInterceptors extends InterceptorsWrapper {
  /// 异常拦截
  @override
  Future onError(error, handler) {
    if (GlobalConstant.debuggable) {
      print('请求异常: ${error.toString()}');
      print('请求异常信息: ${error.response?.toString() ?? ""}');
    }
    // 异常分类
    switch (error.type) {
      // 4xx 5xx response
      case DioErrorType.response:
        // JSON 序列化, Response<dynamic> 转 Map<String, dynamic>
        String jsonStr = json.encode(error.response.data);
        Map<String, dynamic> map = json.decode(jsonStr);
        break;
      case DioErrorType.connectTimeout:
        // TODO: Handle this case.
        break;
      case DioErrorType.sendTimeout:
        // TODO: Handle this case.
        break;
      case DioErrorType.receiveTimeout:
        // TODO: Handle this case.
        break;
      case DioErrorType.cancel:
        // TODO: Handle this case.
        break;
      case DioErrorType.other:
        // TODO: Handle this case.
        break;
    }
    handler.next(error);
  }
}
