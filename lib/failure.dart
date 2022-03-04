abstract class Failure implements Exception {
  final String message;

  Failure(this.message);
}

class FormatFailure extends Failure {
  FormatFailure(String message) : super(message);
}

class EmptyJson extends Failure {
  EmptyJson(String message) : super(message);
}
