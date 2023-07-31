import 'package:biatest_domain/base/api_paths.dart';
import 'package:biatest_domain/base/response_error.dart';
import 'package:biatest_domain/base/response_model.dart';
import 'package:biatest_domain/models/user/user.dart';
import 'package:biatest_domain/models/user/user_model.dart';
import 'package:biatest_domain/repositories/user/user_repository_type.dart';
import 'package:dartz/dartz.dart';

class UserRepository extends UserRepositoryType {
  UserRepository({required super.appConfig});

  @override
  Future<Either<ResponseError, User>> getUser({required String userId}) async {
    ResponseModel response =
        await callGetApi(url: appConfig.baseUrl1, apiPath: ApiPaths.user);
    if (response.success) {
      return Right(User.fromJson(response.response));
    }
    return Left(response.noInternet
        ? const NoConnectionResponseError()
        : CodeResponseError(response.isException ? 500 : response.responseCode,
            response.response));
  }

  @override
  Future<Either<ResponseError, UserModel>> getUsers() async {
    ResponseModel response =
        await callGetApi(url: appConfig.baseUrl1, apiPath: ApiPaths.user);
    if (response.success) {
      return Right(UserModel.fromJson({"users": response.response}));
    }
    return Left(response.noInternet
        ? const NoConnectionResponseError()
        : CodeResponseError(response.isException ? 500 : response.responseCode,
            response.response));
  }
}
