import 'network_decodable.dart';

class ErrorResponse implements ErrorDecodable {
  @override
  String? description;

  @override
  String? errorCode;

  @override
  Decodable fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    description = json['description'];

    return this;
  }
}
