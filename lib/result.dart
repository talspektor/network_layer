enum ResultEnum { success, failure }

class Result<Success, Failure> {
  Success? success;
  Failure? failure;
  ResultEnum resultEnum;

  Result.success(this.success) : resultEnum = ResultEnum.success {
    final onlySuccess = success != null && failure == null;
    assert(onlySuccess);
  }

  Result.failure(this.failure) : resultEnum = ResultEnum.failure {
    final onlyFailure = success == null && failure != null;
    assert(onlyFailure);
  }
}
