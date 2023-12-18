import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app_for_snt/common/enum/dio_enum.dart';
import 'package:weather_app_for_snt/network/model/base/base_model.dart';

class BaseMethods with DioMixin {
  Future<dynamic> make<T extends BaseModel>(
    String path, {
    required T parserModel,
    required MethodType method,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    dynamic data,
    ProgressCallback? onReceiveProgress,
  }) async {
    final options = Options();
    options.method = getMethodType(method);
    final body = getBodyModel(data);

    try {
      final response = await request(path, data: body, options: options);
      return parseBody<T>(response.data, parserModel);
    } on DioException catch (e) {
      return onError(e);
    }
  }

  String getMethodType(MethodType type) {
    switch (type) {
      case MethodType.GET:
        return 'GET';
      case MethodType.POST:
        return 'POST';
    }
  }

  dynamic getBodyModel(dynamic data) {
    if (data == null) {
      return data;
    } else if (data is BaseModel) {
      return data.toJson();
    } else if (data is String) {
      return jsonDecode(data);
    }

    return null;
  }

  dynamic parseBody<T extends BaseModel>(dynamic responseBody, T model) {
    try {
      if (responseBody is List) {
        return responseBody.map((data) => model.fromJson(data)).cast<T>().toList();
      } else if (responseBody is Map<String, Object>) {
        return model.fromJson(responseBody) as T;
      } else {
        return responseBody;
      }
    } catch (e) {
      return responseBody;
    }
  }

  String onError(DioException error) {
    return 'Error';
  }
}
