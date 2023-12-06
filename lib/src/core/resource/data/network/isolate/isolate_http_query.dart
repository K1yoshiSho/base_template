import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:base/src/core/resource/data/network/isolate/isolate_%20error_interceptor.dart';

class IsolateHttpQuery {
  IsolateHttpQuery(this.server);

  Dio dioIsolate = Dio();
  final String? server;

  ///* ---------------------------------- [Isolate HttpQuery] ---------------------------------- */
  /// This class contains custom methods for making http requests. But, it is used in [Isolate] only.

  /// [GET]
  Future<dynamic> getIsolate({
    required String url,
    required String? token,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headerData,
  }) async {
    try {
      dioIsolate.interceptors.add(IsolateErrorInterceptor());
      dioIsolate.interceptors.add(
        TalkerDioLogger(
          talker: TalkerFlutter.init(),
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printRequestData: true,
            printResponseData: false,
            printResponseHeaders: true,
            printResponseMessage: true,
          ),
        ),
      );
      TalkerFlutter.init().info("---------------------------------- Isolate HttpQuery: get ----------------------------------");
      Map<String, dynamic> header = {
        "Content-Type": "application/json",
      };
      Map<String, dynamic> tempQueryParameters = queryParameters ?? {};

      if (token != "" && token != null) {
        header.addAll({"Authorization": 'Token $token'});
      }
      if (headerData != null) {
        header.addAll(headerData);
      }
      Response result = await dioIsolate.get(
        '${server ?? "https://qt.workspace.kz"}/api$url',
        options: Options(
          sendTimeout: const Duration(milliseconds: 30000),
          receiveTimeout: const Duration(milliseconds: 60000),
          headers: header,
        ),
        queryParameters: tempQueryParameters,
      );
      return result.data;
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionTimeout) {}
      if (error.type == DioExceptionType.receiveTimeout) {}
      return error;
    }
  }

  /// [POST]
  Future<dynamic> postIsolate({
    required String url,
    required String? token,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, dynamic>? headerData,
  }) async {
    dioIsolate.interceptors.add(IsolateErrorInterceptor());
    dioIsolate.interceptors.add(
      TalkerDioLogger(
        talker: TalkerFlutter.init(),
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printRequestData: true,
          printResponseData: false,
          printResponseHeaders: true,
          printResponseMessage: true,
        ),
      ),
    );
    TalkerFlutter.init().info("---------------------------------- Isolate HttpQuery: post ----------------------------------");
    Map<String, dynamic> header = {
      "Content-Type": "application/json",
    };

    if (token != "" && token != null) {
      header.addAll({"Authorization": 'Token $token'});
    }
    if (headerData != null) {
      header.addAll(headerData);
    }
    Response result = await dioIsolate.post(
      '${server ?? "https://qt.workspace.kz"}/api/$url',
      options: Options(
        method: 'POST',
        sendTimeout: const Duration(milliseconds: 120000),
        receiveTimeout: const Duration(milliseconds: 120000),
        headers: header,
      ),
      queryParameters: queryParameters,
      data: data,
    );
    return result.data;
  }

  /// [PUT]

  Future<dynamic> putIsolate({
    required String url,
    required String? token,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, dynamic>? headerData,
  }) async {
    dioIsolate.interceptors.add(IsolateErrorInterceptor());
    dioIsolate.interceptors.add(
      TalkerDioLogger(
        talker: TalkerFlutter.init(),
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printRequestData: true,
          printResponseData: false,
          printResponseHeaders: true,
          printResponseMessage: true,
        ),
      ),
    );
    TalkerFlutter.init().info("---------------------------------- Isolate HttpQuery: put ----------------------------------");
    Map<String, dynamic> header = {
      "Content-Type": "application/json",
    };

    if (token != "" && token != null) {
      header.addAll({"Authorization": 'Token $token'});
    }
    if (headerData != null) {
      header.addAll(headerData);
    }
    Response result = await dioIsolate.put(
      '${server ?? "https://qt.workspace.kz"}/api/$url',
      options: Options(
        sendTimeout: const Duration(milliseconds: 30000),
        receiveTimeout: const Duration(milliseconds: 120000),
        headers: header,
      ),
      queryParameters: queryParameters,
      data: data,
    );
    return result.data;
  }

  /// [DELETE]

  Future<dynamic> deleteIsolate({
    required String url,
    required String? token,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headerData,
  }) async {
    dioIsolate.interceptors.add(IsolateErrorInterceptor());
    dioIsolate.interceptors.add(
      TalkerDioLogger(
        talker: TalkerFlutter.init(),
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printRequestData: true,
          printResponseData: false,
          printResponseHeaders: true,
          printResponseMessage: true,
        ),
      ),
    );
    TalkerFlutter.init().info("---------------------------------- Isolate HttpQuery: delete ----------------------------------");
    Map<String, dynamic> header = {
      "Content-Type": "application/json",
    };
    Map<String, dynamic> queryParameters1 = queryParameters ?? {};
    if (token != "") {
      header.addAll({"Authorization": 'Token $token'});
    }
    if (headerData != null) {
      header.addAll(headerData);
    }
    Response result = await dioIsolate.delete(
      '${server ?? "https://qt.workspace.kz"}/api/$url',
      options: Options(
        headers: header,
      ),
      queryParameters: queryParameters1,
      data: data,
    );
    return result.data;
  }
}
