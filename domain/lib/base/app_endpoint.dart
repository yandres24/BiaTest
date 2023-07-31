import 'package:http/http.dart' as http;

mixin AppEndpoint {
  late String baseUrl1;
  late String baseUrl2;
  enableIntercept(http.Response response);
}
