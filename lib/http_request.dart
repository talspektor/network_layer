import 'dart:core';

import 'package:dio/dio.dart';

import 'enumeration.dart';

class ContentEncoding extends Enum<String> {
  const ContentEncoding(String val) : super(val);

  static const url = ContentEncoding('url');
  static const json = ContentEncoding('json');
}

class HttpMethod extends Enum<String> {
  const HttpMethod(String val) : super(val);

  static const get = HttpMethod('GET');
  static const post = HttpMethod('POST');
  static const delete = HttpMethod('DELETE');
  static const put = HttpMethod('PUT');
  static const patch = HttpMethod('PATCH');
}

abstract class HttpRequest {
  RequestOptions get request => RequestOptions(
        baseUrl: baseUrl,
        method: method,
        data: body,
        sendTimeout: sendTimeout,
        receiveTimeout: receiveTimeout,
        extra: extra,
        headers: headers,
        responseType: responseType,
        validateStatus: validateStatus,
        receiveDataWhenStatusError: receiveDataWhenStatusError,
        followRedirects: followRedirects,
        maxRedirects: maxRedirects,
        path: path,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        setRequestContentTypeWhenNoPayload: setRequestContentTypeWhenNoPayload,
        queryParameters: queryParameters,
        connectTimeout: connectTimeout,
      );

  String get baseUrl;
  String get method;
  String get path;
  Map<String, String>? get headers => null;
  Map<String, dynamic>? get body => null;
  int? get sendTimeout => null;
  int? get receiveTimeout => null;
  int? get connectTimeout => null;
  Map<String, dynamic>? get queryParameters => null;
  ProgressCallback? get onReceiveProgress => null;
  ProgressCallback? get onSendProgress => null;
  Map<String, dynamic>? get extra => null;
  ResponseType get responseType => ResponseType.json;
  ValidateStatus? get validateStatus => (statusCode) =>
      statusCode != null ? (statusCode >= 200) && (statusCode < 300) : false;
  bool? get receiveDataWhenStatusError => false;
  bool? get followRedirects => true;
  int? get maxRedirects => 5;
  bool? get setRequestContentTypeWhenNoPayload => false;

  Options get options => Options(
        method: request.method,
        sendTimeout: request.sendTimeout,
        receiveTimeout: request.receiveTimeout,
        extra: request.extra,
        headers: request.headers,
        responseType: request.responseType,
        contentType: request.contentType,
        validateStatus: request.validateStatus,
        receiveDataWhenStatusError: request.receiveDataWhenStatusError,
        followRedirects: request.followRedirects,
        maxRedirects: request.maxRedirects,
        requestEncoder: request.requestEncoder,
        responseDecoder: request.responseDecoder,
        listFormat: request.listFormat,
      );
}
