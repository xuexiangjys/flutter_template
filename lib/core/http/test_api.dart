/*
 * @Author: Nathaniel
 * @Date: 2021-04-27 10:15:33
 */
class TestApi {
  static final baseApi =
      "https://easy-mock.bookset.io/mock/5dfae67d4946c20a50841fa7/example/";

  // 接口返回：{"code": int, "message": "String", "data": {"account": "String", "password": "String"}}
  static final loginPath = "user/login";

  // 接口返回：{"code": ing, "message": "String", "data": [int, int, String, int, String, int]}
  static final queryListPath = "/query/list";

  // 接口返回：{"code": int, "message": "String", "data": [{"account": "String", "password": "String"}， {"account": "String", "password": "String"}]}
  static final queryListJsonPath = "/query/listjson";
}
