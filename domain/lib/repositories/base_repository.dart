import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:biatest_data/models/app_multipart.dart';
import 'package:biatest_data/datasource/remote/network_data.dart';
import 'package:biatest_data/datasource/repositories/remote_repository.dart';
import 'package:biatest_domain/base/app_endpoint.dart';
import 'package:biatest_domain/base/response_model.dart';

class BaseRepository with RemoteRepository {
  BaseRepository({required this.appConfig});

  final AppEndpoint appConfig;

  Future<ResponseModel> callGetApi(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameter,
      Map<String, String>? headers,
      required String apiPath}) async {
    http.Response response = await apiClient.apiRequest(
        url: url,
        method: RequestMethod.GET,
        body: body,
        queryParameter: queryParameter,
        headers: headers,
        apiPath: apiPath);
    return getAppResponse(response);
  }

  Future<ResponseModel> callPostApi(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameter,
      Map<String, String>? headers,
      required String apiPath}) async {
    http.Response response = await apiClient.apiRequest(
        url: url,
        method: RequestMethod.POST,
        body: body,
        queryParameter: queryParameter,
        headers: headers,
        apiPath: apiPath);
    return getAppResponse(response);
  }

  Future<ResponseModel> callDeleteApi(
      {required String url,
      required RequestMethod method,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameter,
      Map<String, String>? headers,
      required String apiPath}) async {
    http.Response response = await apiClient.apiRequest(
        url: url, method: RequestMethod.DELETE, apiPath: apiPath);
    return getAppResponse(response);
  }

  Future<ResponseModel> callPutApi(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameter,
      Map<String, String>? headers,
      required String apiPath}) async {
    http.Response response = await apiClient.apiRequest(
        url: url,
        method: RequestMethod.PUT,
        body: body,
        queryParameter: queryParameter,
        headers: headers,
        apiPath: apiPath);
    return getAppResponse(response);
  }

  Future<ResponseModel> callPatchApi(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, dynamic>? queryParameter,
      Map<String, String>? headers,
      required String apiPath}) async {
    http.Response response = await apiClient.apiRequest(
        url: url,
        method: RequestMethod.PATCH,
        body: body,
        queryParameter: queryParameter,
        headers: headers,
        apiPath: apiPath);
    return getAppResponse(response);
  }

  Future<ResponseModel> callMultipartApi(
      {required String url,
      required AppMultiPartRequest multiPart,
      Map<String, String>? headers,
      required String apiPath}) async {
    http.Response response = await apiClient.multipartRequest(
        url: url, multiPart: multiPart, headers: headers, apiPath: apiPath);
    return getAppResponse(response);
  }

  ResponseModel getAppResponse(http.Response response) {
    appConfig.enableIntercept(response);
    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        return ResponseModel(success: true, response: jsonData);
      } else {
        final jsonData = jsonDecode(response.body);
        return ResponseModel(success: false, response: jsonData);
      }
    } catch (e) {
      return ResponseModel(success: false, response: e, isException: true);
    }
  }
}
