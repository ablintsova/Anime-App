abstract class BaseHttpClient {
  String? accessToken;

  Future get({required query, Map<String, dynamic>? queryParameters});

  Future post({required query, Map<String, dynamic>? data});

  Future put({required query, Map<String, dynamic>? data});

  Future delete({required query, Map<String, dynamic>? data});

  Future fetch({required request});

  void showLog(bool show);
}
