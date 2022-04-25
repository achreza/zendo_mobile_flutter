class BadRequestException implements Exception {
  // ignore: prefer_typing_uninitialized_variables
  final _message;

  BadRequestException([this._message]);

  @override
  String toString() {
    return _message ?? 'Bad request';
  }
}
