import 'package:dio/dio.dart';
import 'package:network_layer/decode.dart';
import 'package:network_layer/failure.dart';
import 'package:network_layer/http_request.dart';

import 'error_response.dart';
import 'network_decodable.dart';
import 'result.dart';

abstract class HttpSessionProtocol {
  Future<Result<DecodeAble, Failure>> request<T extends DecodeAble>(
      {required HttpRequest httpRequest, required T responseType});
}

abstract class Session implements HttpSessionProtocol {
  final dynamic client;

  Session(this.client);
}

class HttpSession extends Session {
  final Dio _client;

  HttpSession(this._client) : super(_client);

  @override
  Future<Result<T, Failure>> request<T extends DecodeAble>(
      {required HttpRequest httpRequest, required T responseType}) async {
    Response response;
    try {
      response = await _client.request(
          '${httpRequest.baseUrl}${httpRequest.path}',
          queryParameters: httpRequest.queryParameters,
          options: httpRequest.options);
      return decode(responseType, response.data);
    } on DioError catch (e) {
      final Map<String, dynamic> responseError = {
        'error_code': '${e.response?.statusCode}',
        'description': e.message
      };
      return Result.failure(ErrorResponse().fromJson(responseError) as Failure);
    } on FormatFailure catch (e) {
      return Result.failure(e);
    }
  }
}
