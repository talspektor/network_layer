import 'network_decodable.dart';

class ErrorResponse implements ErrorDecodeAble {
  @override
  String? description;

  @override
  String? errorCode;

  @override
  DecodeAble fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    description = json['description'];

    return this;
  }
}
