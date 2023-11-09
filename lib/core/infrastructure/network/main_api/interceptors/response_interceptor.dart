import 'package:dio/dio.dart';

import '../main_api_config.dart';

class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    if (response.data case final Map<dynamic, dynamic> data) {
      final avoidExtractingData =
          response.requestOptions.extra[MainApiConfig.avoidExtractingData] !=
              null;
      final supportEmptyList = response
              .requestOptions.extra[MainApiConfig.supportEmptyListExtraKey] !=
          null;
      if (data['results'] != null && !avoidExtractingData) {
        return handler.next(response..data = data['results']);
      } else if (supportEmptyList) {
        return handler.next(response..data = <dynamic>[]);
      }
    }
    return handler.next(response);
  }
}
