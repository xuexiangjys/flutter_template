/*
 * @Author: Nathaniel
 * @Date: 2021-03-30 15:57:50
 */

import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }
}
