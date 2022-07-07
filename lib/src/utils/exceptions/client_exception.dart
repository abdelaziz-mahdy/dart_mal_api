class ClientException implements Exception {
  final Uri url;
  final int statusCode;

  ClientException(this.url, this.statusCode);

  @override
  String toString() {
    return 'Request failed with status code: $statusCode';
  }
}
