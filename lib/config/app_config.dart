import 'package:biatest/environment/environment.dart';
import 'package:biatest_domain/base/app_endpoint.dart';
import 'package:http/src/response.dart';

class AppConfig with AppEndpoint {
  static final AppConfig shared = AppConfig._instance();
  factory AppConfig({required Environment env}) {
    shared.env = env;
    return shared;
  }

  AppConfig._instance();

  Environment? env;

  @override
  String get baseUrl1 => (env?.baseDomain1 ?? '') + (env?.urlPathDomain1 ?? '');

  @override
  String get baseUrl2 => (env?.baseDomain2 ?? '') + (env?.urlPathDomain2 ?? '');

  @override
  enableIntercept(Response response) {}
}
