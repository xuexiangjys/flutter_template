import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_template/core/interceptor/error_interceptor.dart';
import 'package:flutter_template/core/utils/path.dart';
import 'package:flutter_template/model/base_entity.dart';
import 'package:flutter_template/model/error_entity.dart';
import 'package:flutter_template/model/list_entity.dart';
import 'package:flutter_template/utils/error_handler.dart';
import 'package:flutter_template/utils/req_method.dart';
import 'package:logger/logger.dart';

class XHttp {
  XHttp._internal();

  ///网络请求配置
  static final Dio dio = Dio(BaseOptions(
    baseUrl: "https://www.wanandroid.com",
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
    receiveDataWhenStatusError: false,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  ));

  ///初始化dio
  static init() {
    ///初始化cookie
    PathUtils.getDocumentsDirPath().then((value) {
      var cookieJar =
          PersistCookieJar(storage: FileStorage(value + "/.cookies/"));
      dio.interceptors.add(CookieManager(cookieJar));
    });

    //添加拦截器
    dio.interceptors.add(ErrorInterceptor())
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      print("请求之前");
      return handler.next(options);
    }, onResponse: (response, handler) {
      print("响应之前");
      return handler.next(response);
    }, onError: (DioError e, handler) {
      print("错误之前");
      handleError(e);
      return handler.next(e);
    }));
  }

  ///error统一处理
  static void handleError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectTimeout:
        print("连接超时");
        break;
      case DioErrorType.sendTimeout:
        print("请求超时");
        break;
      case DioErrorType.receiveTimeout:
        print("响应超时");
        break;
      case DioErrorType.response:
        print("出现异常");
        break;
      case DioErrorType.cancel:
        print("请求取消");
        break;
      default:
        print("未知错误");
        break;
    }
  }

  ///get请求
  static Future get(String url, [Map<String, dynamic> params]) async {
    Response response;
    if (params != null) {
      response = await dio.get(url, queryParameters: params);
    } else {
      response = await dio.get(url);
    }
    return response.data;
  }

  ///post 表单请求
  static Future post(String url, [Map<String, dynamic> params]) async {
    Response response = await dio.post(url, queryParameters: params);
    return response.data;
  }

  ///post body请求
  static Future postJson(String url, [Map<String, dynamic> data]) async {
    Response response = await dio.post(url, data: data);
    return response.data;
  }

  ///下载文件
  static Future downloadFile(urlPath, savePath) async {
    Response response;
    try {
      response = await dio.download(urlPath, savePath,
          onReceiveProgress: (int count, int total) {
        //进度
        print("$count $total");
      });
    } on DioError catch (e) {
      handleError(e);
    }
    return response.data;
  }

  static Logger getLogger() {
    return Logger(printer: PrettyPrinter());
  }

  static Logger getLoggerNoStack() {
    return Logger(
      printer: PrettyPrinter(methodCount: 0),
    );
  }

  static Future request<T>(ReqMethod method, String path,
      {Map<String, Object> params,
      Function(T) success,
      Function(ErrorEntity) failure}) async {
    try {
      Response response = await dio.request(path,
          queryParameters: params,
          options: Options(method: MethodVaule[method]));
      if (response != null) {
        BaseEntity baseEntity = BaseEntity<T>.fromJson(response.data);
        if (baseEntity.code == 0) {
          success(baseEntity.data);
        } else {
          failure(
              ErrorEntity(code: baseEntity.code, message: baseEntity.message));
        }
      } else {
        failure(ErrorEntity(code: -1, message: "unknown error"));
      }
    } on DioError catch (e) {
      failure(ErrorHandler.handleError(e));
    }
  }

  static Future requestList<T>(ReqMethod method, String path,
      {Map<String, Object> params,
      Function(List<T>) success,
      Function(ErrorEntity) failure}) async {
    try {
      Response response = await dio.request(path,
          queryParameters: params,
          options: Options(method: MethodVaule[method]));
      if (response != null) {
        ListEntity<T> listEntity = ListEntity<T>.fromJson(response.data);
        if (listEntity.code == 0) {
          success(listEntity.data);
        } else {
          failure(
              ErrorEntity(code: listEntity.code, message: listEntity.message));
        }
      } else {
        failure(ErrorEntity(code: -1, message: "unknown error"));
      }
    } on DioError catch (e) {
      failure(ErrorHandler.handleError(e));
    }
  }
}
