import 'package:biatest_domain/base/app_endpoint.dart';
import 'package:biatest_domain/di/validator_module.dart';
import 'package:biatest_domain/repositories/user/user_repository.dart';
import 'package:biatest_domain/usercases/user/user_usecase.dart';
import 'package:biatest_domain/usercases/user/user_usecase.type.dart';

mixin UseCaseModule on ValidatorModule {
  UserUseCaseType getUserUserCase({required AppEndpoint appConfigType}) {
    return UserUseCase(repository: UserRepository(appConfig: appConfigType));
  }
}
