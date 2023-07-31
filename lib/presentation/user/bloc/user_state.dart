import 'package:biatest_domain/models/user/user_model.dart';
import 'package:equatable/equatable.dart';

class UserState extends Equatable {
  const UserState({this.message, this.successResponse, this.loading});

  final String? message;
  final UserModel? successResponse;
  final bool? loading;

  @override
  List<Object?> get props => [message, successResponse, loading];

  UserState copyWith(
      {String? message, UserModel? successResponse, bool? loading}) {
    return UserState(
        message: message ?? this.message,
        successResponse: successResponse ?? this.successResponse,
        loading: loading ?? this.loading);
  }
}
