import 'package:equatable/equatable.dart';

import '../../model/model_login.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState {
  final ModelLogin loginData;

  const LoginSuccess(this.loginData);

  @override
  // TODO: implement props
  List<Object?> get props => [loginData];
}

class LoginError extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
