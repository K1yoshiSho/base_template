// ignore_for_file: file_names

import 'package:base/src/core/common/exports/main_export.dart';

/// [IsolateErrorInterceptor] - This class is used to intercept [dio] errors. But, it is used in [Isolate] only.

class IsolateErrorInterceptor extends Interceptor {
  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    Talker log = TalkerFlutter.init();
    Response response = err.response ?? Response(requestOptions: err.requestOptions);

    errorMessage(String errorMessage) {
      return DioException(error: errorMessage, message: errorMessage, requestOptions: err.requestOptions, response: err.response, type: err.type);
    }

    log.error(
        "--------------------ERROR - START--------------------\nERROR_TYPE: ${err.type}\nPATH: ${err.requestOptions.path}\n${err.message}\n${err.response?.data}\n--------------------ERROR - END--------------------");

    if (err.type == DioExceptionType.connectionError) {
      return handler.reject(errorMessage(ErrorsKeys.noConnection));
    } else if (err.type == DioExceptionType.connectionTimeout) {
      return handler.reject(errorMessage(ErrorsKeys.connectionTimeout));
    } else if (err.response == null) {
      return handler.reject(err);
    } else if (err.message.toString().contains("Invalid login details")) {
      return handler.reject(errorMessage(ErrorsKeys.passwordNotCorrect));
    } else if (response.statusCode == 400) {
      return handler.reject(errorMessage(ErrorsKeys.badRequest));
    } else if (response.statusCode == 401) {
      if (response.data.toString().contains("Invalid login details")) {
        return handler.reject(errorMessage(ErrorsKeys.passwordNotCorrect));
      } else {
        return handler.reject(errorMessage(ErrorsKeys.status401));
      }
    } else if (response.statusCode == 404) {
      return handler.reject(errorMessage(ErrorsKeys.status404));
    } else if (response.statusCode! >= 500) {
      return handler.reject(errorMessage(ErrorsKeys.status500));
    }
    return handler.reject(err);
  }
}
