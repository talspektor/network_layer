abstract class RequestDecodeAble {
  Map<String, dynamic> toJson();
}

abstract class DecodeAble {
  factory DecodeAble(DecodeAble type, dynamic data) {
    if (type is BaseDecodeAble) {
      return type.fromJson(data);
    } else if (type is ListDecodeAble) {
      return type.fromJsonList(data);
    }
    return type;
  }
}

abstract class BaseDecodeAble<T> implements DecodeAble {
  DecodeAble fromJson(Map<String, dynamic> json);
}

abstract class ListDecodeAble<T> implements DecodeAble {
  late final List<T> list;
  DecodeAble fromJsonList(List<dynamic> json);
}

abstract class ErrorDecodeAble extends BaseDecodeAble {
  String? errorCode;
  String? description;
}
