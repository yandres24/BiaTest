import 'package:biatest/config/app_config.dart';
import 'package:biatest/presentation/user/bloc/user_bloc.dart';
import 'package:biatest/presentation/user/bloc/user_state.dart';
import 'package:biatest_domain/di/usecase_module.dart';
import 'package:biatest_domain/di/validator_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatelessWidget with ValidatorModule, UseCaseModule {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) {
        return UserBloc(getUserUserCase(appConfigType: AppConfig.shared));
      },
      child: const UserPage(),
    );
  }
}

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, userState) {
      if (userState.loading ?? false) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return ListView.builder(
        itemCount: userState.successResponse?.users?.length ?? 0,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                userState.successResponse?.users![index].name ?? "Not Loaded"),
          );
        },
      );
    });
  }
}
