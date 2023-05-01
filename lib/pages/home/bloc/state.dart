import 'package:equatable/equatable.dart';

import '../model/model_about_profile.dart';
import '../model/model_user.dart';

abstract class HomeState extends Equatable {}

class HomeInitialState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeSuccessState extends HomeState {
  final ModelUser modelUser;

  HomeSuccessState({required this.modelUser});

  @override
  // TODO: implement props
  List<Object?> get props => [modelUser];
}

class HomeSuccessProfile extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingHomeSaveProfile extends HomeState {
  final bool loading;

  LoadingHomeSaveProfile({required this.loading});

  @override
  // TODO: implement props
  List<Object?> get props => [loading];
}

class SuccessHomeSaveProfile extends HomeState {
  final ModelAboutProfile profile;
  SuccessHomeSaveProfile({required this.profile});
  @override
  // TODO: implement props
  List<Object?> get props => [profile];
}
