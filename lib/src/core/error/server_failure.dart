class ServerFailure implements Exception {
  final String message;
  ServerFailure(this.message);

  @override
  String toString() => "Server failure: $message";
}
