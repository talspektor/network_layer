abstract class RequestMapable {
  Map<String, dynamic> toJson();
}

abstract class Mapable {
  factory Mapable(Mapable type, dynamic data) {
    if (type is BaseMapable) {
      return type.fromJson(data);
    } else if (type is ListMapable) {
      return type.fromJsonList(data);
    }
    return type;
  }
}

abstract class BaseMapable<T> implements Mapable {
  Mapable fromJson(Map<String, dynamic> json);
}

abstract class ListMapable<T> implements Mapable {
  Mapable fromJsonList(List<dynamic> json);
}

abstract class ErrorMapable extends BaseMapable {
  String? errorCode;
  String? description;
}
