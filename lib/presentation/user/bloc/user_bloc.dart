import 'package:biatest/presentation/user/bloc/user_state.dart';
import 'package:biatest_domain/usercases/user/user_usecase.type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Cubit<UserState> {
  UserBloc(this.useCaseType) : super(const UserState(loading: true)) {
    getUsers();
  }

  final UserUseCaseType useCaseType;

  getUsers() async {
    final result = await useCaseType.getUsers();
    result.fold((error) {
      emit(state.copyWith(loading: false, message: error.message));
    }, (success) {
      emit(state.copyWith(loading: false, successResponse: success));
    });
  }
}
