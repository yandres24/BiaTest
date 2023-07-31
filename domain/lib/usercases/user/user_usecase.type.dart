import 'package:biatest_domain/base/response_error.dart';
import 'package:biatest_domain/models/user/user.dart';
import 'package:biatest_domain/models/user/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class UserUseCaseType {
  Future<Either<ResponseError, UserModel>> getUsers();

  Future<Either<ResponseError, User>> getUser({required String userId});
}
