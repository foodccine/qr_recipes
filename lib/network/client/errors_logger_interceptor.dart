import 'package:dio/dio.dart';

class ErrorsLoggerInterceptor extends Interceptor {
  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    return handler.next(err);
  }
}
