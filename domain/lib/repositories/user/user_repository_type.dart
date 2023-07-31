import 'package:biatest_domain/base/response_error.dart';
import 'package:biatest_domain/models/user/user.dart';
import 'package:biatest_domain/models/user/user_model.dart';
import 'package:biatest_domain/repositories/base_repository.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepositoryType extends BaseRepository {
  UserRepositoryType({required super.appConfig});

  Future<Either<ResponseError, UserModel>> getUsers();

  Future<Either<ResponseError, User>> getUser({required String userId});
}
