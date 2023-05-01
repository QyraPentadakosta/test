import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AddListEvent extends Equatable {}

class InitialAddListEvent extends AddListEvent {
  @override
  List<Object> get props => [];
}

class AddListDataEvent extends AddListEvent {
  final BuildContext context;
  final int idUser;
  final List<String> data;

  AddListDataEvent(this.context, {required this.idUser, required this.data});

  @override
  List<Object> get props => [data, context];
}
