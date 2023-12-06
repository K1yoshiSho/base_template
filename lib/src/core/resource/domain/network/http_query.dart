abstract interface class BaseHttpQuery {
  Future<dynamic> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headerData,
  });
  Future<dynamic> post({
    required String url,
    Map<String, dynamic>? queryParameters,
    required dynamic data,
    Map<String, dynamic>? headerData,
  });

  Future<dynamic> patch({
    required String url,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, dynamic>? headerData,
  });

  Future<dynamic> put({
    required String url,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, dynamic>? headerData,
  });
  Future<dynamic> delete({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headerData,
  });
}
