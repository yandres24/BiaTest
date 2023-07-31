int internalError = 500;
int badRequest = 400;

class ResponseModel {
  final bool success;
  final dynamic response;
  final bool noInternet;
  final bool isException;
  final int responseCode;

  ResponseModel(
      {this.success = false,
      this.response,
      this.noInternet = false,
      this.isException = false,
      this.responseCode = 0});
}
