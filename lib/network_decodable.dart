abstract class RequestDecodable {
  Map<String, dynamic> toJson();
}

abstract class Decodable {
  factory Decodable(Decodable type, dynamic data) {
    if (type is Basedecodable) {
      return type.fromJson(data);
    } else if (type is ListDicodable) {
      return type.fromJsonList(data);
    }
    return type;
  }
}

abstract class Basedecodable<T> implements Decodable {
  Decodable fromJson(Map<String, dynamic> json);
}

abstract class ListDicodable<T> implements Decodable {
  Decodable fromJsonList(List<dynamic> json);
}

abstract class Errordecodable extends Basedecodable {
  String? errorCode;
  String? description;
}
