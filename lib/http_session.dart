import 'package:dio/dio.dart';
import 'package:network_layer/http_request.dart';

import 'error_response.dart';
import 'network_decodable.dart';

abstract class HttpSessionProtocol {
  Future<T> request<T extends Decodable>(
      {required HttpRequest httpRequest, required Decodable responseType});
}

abstract class Session implements HttpSessionProtocol {
  final dynamic client;

  Session(this.client);
}

class HttpSession extends Session {
  final Dio _client;

  HttpSession(this._client) : super(_client);

  @override
  Future<T> request<T extends Decodable>(
      {required HttpRequest httpRequest,
      required Decodable responseType}) async {
    Response response;
    try {
      response = await _client.request(
          '${httpRequest.baseUrl}${httpRequest.path}',
          queryParameters: httpRequest.queryParameters,
          data: httpRequest.body,
          options: httpRequest.options);
      return Decodable(responseType, response.data) as T;
    } catch (e) {
      if (e is DioError) {
        final Map<String, dynamic> responseError = {
          'error_code': '${e.response?.statusCode}',
          'description': e.message
        };
        throw ErrorResponse().fromJson(responseError);
      } else {
        rethrow;
      }
    }
  }
}
