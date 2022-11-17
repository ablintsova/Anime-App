import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../constants.dart';
import 'base_http_client.dart';

@Injectable(as: BaseHttpClient, env: [Environment.dev])
class AppHttpClient extends _HttpClient {
  AppHttpClient({String baseUrl = baseURL})
      : super(
          Dio(BaseOptions(
              baseUrl: baseUrl,
              connectTimeout: 20000,
              receiveTimeout: 20000,
              headers: {
                "content-type": "application/json",
              })),
        );
}

class _HttpClient implements BaseHttpClient {
  final Dio _dio;

  @override
  String? accessToken;
  bool _showLog = true;
  bool shouldRefresh = false;

  _HttpClient(this._dio) {
    _setInterceptors();
  }

  @override
  void showLog(bool show) => _showLog = show;

  @override
  Future get({
    required query,
    Map<String, dynamic>? queryParameters,
    bool useBaseUrl = true,
  }) async {
    return await _sendRequest(_dio.get(
      query,
      queryParameters: queryParameters,
    ));
  }

  @override
  Future post({
    required query,
    Map<String, dynamic>? data,
    bool useBaseUrl = true,
  }) async {
    return await _sendRequest(
      _dio.post(query, data: data),
    );
  }

  @override
  Future put({
    required query,
    Map<String, dynamic>? data,
  }) async {
    return await _sendRequest(
      _dio.put(query, data: data),
    );
  }

  @override
  Future delete({
    required query,
    Map<String, dynamic>? data,
    bool useBaseUrl = false,
  }) async {
    return await _sendRequest(
      _dio.delete(query, data: data),
    );
  }

  @override
  Future fetch({required request}) async {
    return await _sendRequest(_dio.fetch(request));
  }

  Future _sendRequest(Future<Response> request) async {
    final Response response = await request.catchError((error) {
      if (error is DioError) {
        print("Dio error: $error");
        /*HttpRequestException exception;
        if (error.message.contains("Failed host lookup")) {
          exception = HttpRequestException.noInternet();
          getIt.get<NetworkStatusBloc>().add(SaveFailedRequest(
            request: error.requestOptions,
          ));
          NetworkStatusBloc.connectionStream.sink.add(false);
        } else {
          String errorMessage;
          exception = HttpRequestException.fromJson(error.response?.data);
          errorMessage = error.response?.data['msg'] ?? error.message;
          getIt.get<BaseBloc>().add(BaseEvent(
            errorMessage: errorMessage,
            requestError: exception,
          ));
        }
        throw exception;*/
      }
    });
    final result = response.data;
    if (result['data'] != null) {
      return result['data'] ?? true;
    } else {
      return false;
    }
  }

  Future<void> _setInterceptors() async {
    //_dio.interceptors.add(ChuckerDioInterceptor());
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (_showLog) {
          print("\n---------- DioRequest ----------"
              "\n\turl: ${options.baseUrl}${options.path}"
              "\n\tquery: ${options.queryParameters}"
              "\n\tmethod: ${options.method}"
              "\n\tdata: ${options.data}"
              "\n\theaders: ${options.headers}\n}"
              "\n--------------------------------\n");
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        final options = response.requestOptions;
        if (_showLog) {
          print("\n---------- DioResponse ----------"
              "\n\turl: ${options.baseUrl}${options.path}"
              "\n\tmethod: ${options.method}"
              "\n\tresponse: $response"
              "\n--------------------------------\n");
        }
        //NetworkStatusBloc.connectionStream.sink.add(true);
        return handler.next(response);
      },
      onError: (error, handler) async {
        final options = error.requestOptions;
        print("\n---------- DioError ----------"
            "\n\turl: ${options.baseUrl}${options.path}"
            "\n\tmethod: ${options.method}"
            "\n\tmessage: ${error.message}"
            "\n\tresponse: ${error.response}"
            "\n--------------------------------\n");
        return handler.next(error);
      },
    ));
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }
}
