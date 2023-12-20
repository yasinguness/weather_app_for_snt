import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:weather_app_for_snt/common/enum/dio_enum.dart';
import 'package:weather_app_for_snt/network/model/base/base_model.dart';

/// Bu tür bir base yapısı tasarlayarak, tekrarlanan kodları azaltmayı,
/// requestleri ve responseleri merkezi bir şekilde yönetmeyi sağlamayı amaçladım.
/// Bu sayede,requestleri yönetmek ve gelen responseleri modele dönüştürmek
/// kolaylaştı.
///Ayrıca, error handlinge yönelik genel bir yaklaşım sağladım ve kodum daha okunabilir,
///bakımı daha kolay hale geldi.
class BaseMethods with DioMixin {
  Future<dynamic> make<T extends BaseModel<T>>(
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
    final body = getBodyModel<T>(data);

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

  dynamic getBodyModel<T>(dynamic data) {
    if (data == null) {
      return data;
    } else if (data is BaseModel) {
      return data.toJson();
    } else if (data is String) {
      return jsonDecode(data);
    }

    return null;
  }

  dynamic parseBody<T extends BaseModel<T>>(dynamic responseBody, T model) {
    try {
      if (responseBody is List) {
        return responseBody.map((data) => model.fromJson(data as Map<String, dynamic>)).cast<T>().toList();
      } else if (responseBody is Map<String, Object>) {
        return model.fromJson(responseBody);
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
