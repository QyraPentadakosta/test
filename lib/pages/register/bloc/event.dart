import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class RegisterEvent extends Equatable {}

class DoRegister extends RegisterEvent {
  final BuildContext context;
  final String userName;
  final String email;
  final String password;

  DoRegister(
    this.context, {
    required this.userName,
    required this.email,
    required this.password,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [userName, email, password];
}
