import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationInterceptor extends Interceptor {
  final GetStorage _storage;
  AuthenticationInterceptor(this._storage);

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? token;
    token = _storage.read('token');

    if (token == null) {
      return super.onRequest(options, handler);
    }

    if (token.isNotEmpty) {
      options.headers.addAll({"Authorization": "Token $token"});
    }
    return super.onRequest(options, handler);
  }
}
