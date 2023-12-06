import 'package:base/src/core/resource/domain/models/token.dart';
import 'package:base/src/core/resource/domain/network/http_query.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:base/src/core/common/exports/main_export.dart';

final class HttpQuery implements BaseHttpQuery {
  final bool useGeneralDio;
  HttpQuery({
    this.useGeneralDio = false,
  });

  static const String baseUrl = 'https://django-app.loca-app.me/api/';

  ///* ---------------------------------- [HttpQuery] ---------------------------------- */
  /// This class contains custom methods for making http requests.

  /// [GET]
  @override
  Future<dynamic> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headerData,
  }) async {
    try {
      Map<String, dynamic> header = {
        "Content-Type": "application/json",
      };
      Map<String, dynamic> tempQueryParameters = queryParameters ?? {};
      if (headerData != null) header.addAll(headerData);
      final Response result = await getDio().get(
        url,
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
  @override
  Future<dynamic> post({
    required String url,
    Map<String, dynamic>? queryParameters,
    required dynamic data,
    Map<String, dynamic>? headerData,
  }) async {
    try {
      Map<String, dynamic> header = {
        "Content-Type": "application/json",
      };
      Map<String, dynamic> tempQueryParameters = queryParameters ?? {};
      if (headerData != null) header.addAll(headerData);

      final Response result = await getDio().post(
        url,
        options: Options(
          method: 'POST',
          sendTimeout: const Duration(milliseconds: 120000),
          receiveTimeout: const Duration(milliseconds: 120000),
          headers: header,
        ),
        queryParameters: tempQueryParameters,
        data: data,
      );
      return result.data;
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionTimeout) {}
      if (error.type == DioExceptionType.receiveTimeout) {}
      return error;
    }
  }

  /// [PATCH]
  @override
  Future<dynamic> patch({
    required String url,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, dynamic>? headerData,
  }) async {
    try {
      Map<String, dynamic> header = {
        "Content-Type": "application/json",
      };
      Map<String, dynamic> tempQueryParameters = queryParameters ?? {};
      if (headerData != null) header.addAll(headerData);

      final Response result = await getDio().patch(
        url,
        options: Options(
          method: 'PATCH',
          sendTimeout: const Duration(milliseconds: 120000),
          receiveTimeout: const Duration(milliseconds: 120000),
          headers: header,
        ),
        queryParameters: tempQueryParameters,
        data: data,
      );
      return result.data;
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionTimeout) {}
      if (error.type == DioExceptionType.receiveTimeout) {}
      return error;
    }
  }

  /// [PUT]
  @override
  Future<dynamic> put({
    required String url,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, dynamic>? headerData,
  }) async {
    try {
      Map<String, dynamic> header = {
        "Content-Type": "application/json",
      };
      if (headerData != null) header.addAll(headerData);
      Map<String, dynamic> tempQueryParameters = queryParameters ?? {};
      final Response result = await getDio().put(
        url,
        options: Options(
          sendTimeout: const Duration(milliseconds: 30000),
          receiveTimeout: const Duration(milliseconds: 120000),
          headers: header,
        ),
        queryParameters: tempQueryParameters,
        data: data,
      );
      return result.data;
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionTimeout) {}
      if (error.type == DioExceptionType.receiveTimeout) {}
      return error;
    }
  }

  /// [DELETE]
  @override
  Future<dynamic> delete({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headerData,
  }) async {
    try {
      Map<String, dynamic> header = {
        "Content-Type": "application/json",
      };
      Map<String, dynamic> tempQueryParameters = queryParameters ?? {};
      if (headerData != null) header.addAll(headerData);
      final Response result = await getDio().delete(
        url,
        options: Options(
          headers: header,
        ),
        queryParameters: tempQueryParameters,
        data: data,
      );
      return result.data;
    } on DioException catch (error) {
      if (error.type == DioExceptionType.connectionTimeout) {}
      if (error.type == DioExceptionType.receiveTimeout) {}
      return error;
    }
  }
}

Dio getDio() {
  Dio dio = Dio(BaseOptions(baseUrl: HttpQuery.baseUrl));

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        TokenModel? tokenModel = await UserSecureStorage.getToken();
        if (tokenModel != null) {
          options.headers['Authorization'] = 'Token ${tokenModel.access}';
        }
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          // If a 401 response is received, refresh the access token
          TokenModel? oldToken = await UserSecureStorage.getToken();
          TokenModel? tokenModel = await dio.post('accounts/token/refresh/',
              options: Options(
                sendTimeout: const Duration(milliseconds: 30000),
                receiveTimeout: const Duration(milliseconds: 60000),
                headers: {
                  "Content-Type": "application/json",
                },
              ),
              data: {
                "refresh": oldToken?.refresh,
              }).then((value) => TokenModel.fromJson(value.data));

          // Update the request header with the new access token
          e.requestOptions.headers['Authorization'] = 'Token ${tokenModel?.access}';
          await UserSecureStorage.setToken(tokenModel!);

          // Repeat the request with the updated header
          return handler.resolve(await dio.fetch(e.requestOptions));
        }
        return handler.next(e);
      },
    ),
  );
  dio.interceptors.add(ErrorInterceptor());

  /// Adds [TalkerDioLogger] to intercept Dio requests and responses and log them using Talker service.
  dio.interceptors.add(
    TalkerDioLogger(
      talker: dependenciesContainer.talker,
      settings: TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printRequestData: true,
        printResponseData: true,
        printResponseHeaders: true,
        printResponseMessage: true,
        errorPen: AnsiPen()..red(bold: true),
      ),
    ),
  );
  return dio;
}

Dio getGeneralDio() {
  Dio dio = Dio();

  /// Adds [ErrorInterceptor] to intercept and handle Dio errors across the app.
  dio.interceptors.add(ErrorInterceptor());

  /// Adds [TalkerDioLogger] to intercept Dio requests and responses and log them using Talker service.
  dio.interceptors.add(
    TalkerDioLogger(
      talker: dependenciesContainer.talker,
      settings: TalkerDioLoggerSettings(
        printRequestHeaders: true,
        printRequestData: true,
        printResponseData: true,
        printResponseHeaders: true,
        printResponseMessage: true,
        errorPen: AnsiPen()..red(bold: true),
      ),
    ),
  );
  return dio;
}
