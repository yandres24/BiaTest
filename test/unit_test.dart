// This is an example unit test.
//
// A unit test tests a single function, method, or class. To learn more about
// writing unit tests, visit
// https://flutter.dev/docs/cookbook/testing/unit/introduction

import 'package:biatest_domain/base/app_endpoint.dart';
import 'package:biatest_domain/repositories/user/user_repository.dart';
import 'package:biatest_domain/usercases/user/user_usecase.dart';
import 'package:biatest_domain/usercases/user/user_usecase.type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:biatest/config/app_config.dart';
import 'package:biatest/environment/environment.dart';

void main() async {
  AppEndpoint appConfigType = AppConfig(env: Environment.production());
  UserUseCaseType useCaseType =
      UserUseCase(repository: UserRepository(appConfig: appConfigType));
  final result = await useCaseType.getUsers();
  result.fold((errorResponse) {
    print(errorResponse.message);
  }, (response) {
    for (var user in (response.users ?? [])) {
      print((user.toJson()));
    }
  });
  group('Plus Operator', () {
    test('should add two numbers together', () {
      expect(1 + 1, 2);
    });
  });
}
