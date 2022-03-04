import 'package:network_layer/network_decodable.dart';
import 'package:network_layer/result.dart';

import 'failure.dart';

Result<T, FormatFailure> decode<T extends DecodeAble>(T type, dynamic json) {
  try {
    final T decodeAble;
    if (type is BaseDecodeAble) {
      decodeAble = type.fromJson(json) as T;
    } else if (type is ListDecodeAble) {
      decodeAble = type.fromJsonList(json) as T;
    } else {
      return Result.failure(
          FormatFailure('You most use BaseJsonConvert or ListJsonConvert'));
    }
    return Result.success(decodeAble);
  } catch (e) {
    final message = e is FormatException ? e.message : 'json type error';
    final failure = FormatFailure(message);
    return Result.failure(failure);
  }
}
