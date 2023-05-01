import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginEvent extends Equatable {}

class DoLoginEvent extends LoginEvent {
  final BuildContext context;
  final String email;
  final String password;

  DoLoginEvent(this.context, {required this.email, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
