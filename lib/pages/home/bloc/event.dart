import 'package:equatable/equatable.dart';

import '../model/model_about_profile.dart';

abstract class HomeEvent extends Equatable {}

class GetDataProfileEvent extends HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetDataProfileImageEvent extends HomeEvent {
  final int idUser;

  GetDataProfileImageEvent({required this.idUser});

  @override
  // TODO: implement props
  List<Object?> get props => [idUser];
}

class SaveActionProfileState extends HomeEvent {
  final int idUser;
  final ModelAboutProfile profile;
  SaveActionProfileState({required this.profile, required this.idUser});

  @override
  // TODO: implement props
  List<Object?> get props => [idUser, profile];
}
