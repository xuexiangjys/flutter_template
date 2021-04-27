/*
 * @Author: Nathaniel
 * @Date: 2021-04-27 10:40:43
 */
import 'package:dio/dio.dart';
import 'package:flutter_template/core/global_constant.dart';

/// Dio 请求与响应拦截器
class ReqResInterceptors extends InterceptorsWrapper {
  /// 请求拦截
  @override
  Future onRequest(options, handler) {
    if (GlobalConstant.debuggable) {
      print("请求baseUrl：${options.baseUrl}");
      print("请求url：${options.path}");
      print('请求头: ${options.headers.toString()}');
      if (options.data != null) {
        print('请求参数: ${options.data.toString()}');
      }
    }
    handler.next(options);
  }

  /// 响应拦截
  @override
  Future onResponse(response, handler) {
    Response res = response;
    if (response != null) {
      if (GlobalConstant.debuggable) {
        print('响应: ${response.toString()}');
      }
    }
    if (response.statusCode == 200) {
      int errCode = response.data["errCode"];
      if (errCode == ErrorCode.SUCCESS) {
        res = response;
      }
    }
    handler.next(response);
  }
}
