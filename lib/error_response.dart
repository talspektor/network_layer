import 'network_mappers.dart';

class ErrorResponse implements ErrorMapable {
  @override
  String? description;

  @override
  String? errorCode;

  @override
  Mapable fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    description = json['description'];

    return this;
  }
}
