import 'failure.dart';

enum ResultEnum { success, failure }

extension ResultEnumExt on ResultEnum {
  dynamic value<T>(Result<T, Failure> result) {
    switch (this) {
      case ResultEnum.success:
        return Result.success(result._success)._success as T;
      case ResultEnum.failure:
        return Result.failure(result._failure)._failure as Failure;
    }
  }
}

class Result<Success, Failure> {
  Success? _success;
  Failure? _failure;
  ResultEnum resultEnum;

  Result.success(this._success) : resultEnum = ResultEnum.success {
    final onlySuccess = _success != null && _failure == null;
    assert(onlySuccess);
  }

  Result.failure(this._failure) : resultEnum = ResultEnum.failure {
    final onlyFailure = _success == null && _failure != null;
    assert(onlyFailure);
  }
}
