class HTTPResponse<T> {
  bool isSuccessful;
  T? data;
  String message;
  int statusCode;
  HTTPResponse(this.isSuccessful, this.data, {required this.message, required this.statusCode});
}
