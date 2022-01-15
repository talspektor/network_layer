import 'package:dio/dio.dart';
import 'package:network_layer/http_request.dart';

import 'error_response.dart';
import 'network_mappers.dart';

abstract class HttpSessionProtocol {
  Future<T> request<T extends Mapable>(
      {required HttpRequest httpRequest, required Mapable responseType});
}

abstract class Session implements HttpSessionProtocol {
  final dynamic client;

  Session(this.client);
}

class HttpSession extends Session {
  final Dio _client;

  HttpSession(this._client) : super(_client);

  @override
  Future<T> request<T extends Mapable>(
      {required HttpRequest httpRequest, required Mapable responseType}) async {
    Response response;
    try {
      response = await _client.request(
          '${httpRequest.baseUrl}${httpRequest.path}',
          queryParameters: httpRequest.queryParameters,
          options: httpRequest.options);
      print(httpRequest.request.uri);
      return Mapable(responseType, response.data) as T;
    } catch (e) {
      if (e is DioError) {
        print(e.type);
        print('error HttpSession baseUrl: ${e.requestOptions.uri}');
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
