import 'package:dartz/dartz.dart';
import 'package:biatest_domain/base/response_error.dart';
import 'package:biatest_domain/models/user/user.dart';
import 'package:biatest_domain/models/user/user_model.dart';
import 'package:biatest_domain/usercases/user/user_usecase.type.dart';
import 'package:biatest_domain/repositories/user/user_repository_type.dart';

class UserUseCase extends UserUseCaseType {
  UserUseCase({required this.repository});

  final UserRepositoryType repository;

  @override
  Future<Either<CodeResponseError, User>> getUser(
      {required String userId}) async {
    final result = await repository.getUser(userId: userId);
    return result.fold((errorResponse) {
      return Left(CodeResponseError(100, errorResponse.message));
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<CodeResponseError, UserModel>> getUsers() async {
    final result = await repository.getUsers();
    return result.fold((errorResponse) {
      return Left(CodeResponseError(100, errorResponse.message));
    }, (response) {
      return Right(response);
    });
  }
}
