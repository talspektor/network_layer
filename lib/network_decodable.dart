abstract class RequestDecodable {
  Map<String, dynamic> toJson();
}

abstract class Decodable {
  factory Decodable(Decodable type, dynamic data) {
    if (type is BaseDecodable) {
      return type.fromJson(data);
    } else if (type is ListDicodable) {
      return type.fromJsonList(data);
    }
    return type;
  }
}

abstract class BaseDecodable<T> implements Decodable {
  Decodable fromJson(Map<String, dynamic> json);
}

abstract class ListDicodable<T> implements Decodable {
  late final List<T> list;
  Decodable fromJsonList(List<dynamic> json);
}

abstract class ErrorDecodable extends BaseDecodable {
  String? errorCode;
  String? description;
}
