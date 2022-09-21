import 'dart:io';

import 'package:dio/dio.dart';
import 'package:owner_app/app/data/models/ocr/ocr_response.dart';

class OcrRepository {
  final Dio _dio;

  OcrRepository(this._dio);

  Future<String> scanOcr(File image) async {
    String fileName = image.path.split('/').last;
    FormData formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(image.path, filename: fileName),
    });
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<OcrResponse>(Options(method: 'POST')
            .compose(_dio.options, '/api/ocr/run-ocr', data: formData)
            .copyWith(baseUrl: _dio.options.baseUrl)));
    final value = OcrResponse.fromJson(_result.data!);
    return value.data.toString();
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
