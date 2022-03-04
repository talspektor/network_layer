abstract class RequestDecodeAble {
  Map<String, dynamic> toJson();
}

abstract class DecodeAble {
  DecodeAble.empty();
}

abstract class BaseDecodeAble extends DecodeAble {
  BaseDecodeAble.empty() : super.empty();
  DecodeAble fromJson(Map<String, dynamic> json);
}

abstract class ListDecodeAble<T> extends DecodeAble {
  List<T> get list;
  ListDecodeAble.empty() : super.empty();
  DecodeAble fromJsonList(List<dynamic> json);
}

abstract class ErrorDecodeAble extends BaseDecodeAble {
  String? errorCode;
  String? description;

  ErrorDecodeAble.empty() : super.empty();
}
