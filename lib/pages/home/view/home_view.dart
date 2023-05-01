import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../widget/appbar/app_bar_primary.dart';
import '../../../widget/bg/background.dart';
import '../bloc/bloc.dart';
import '../bloc/event.dart';
import '../bloc/state.dart';
import '../view_model/view_model.dart';
import '../widget/about.dart';
import '../widget/interest.dart';
import '../widget/profile_image.dart';

class HomeView extends StatelessWidget {
  static const String routeName = '/home';

  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeBloc()..add(GetDataProfileEvent()),
      child: Builder(
        builder: (context) => ChangeNotifierProvider(
          create: (BuildContext context) => HomeViewModel(context),
          builder: (context, child) => _body(context),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: const Color(0xFF09141A),
          appBar: IAppBar.primary(
            title: state is HomeSuccessState
                ? state.modelUser.userName
                : state is SuccessHomeSaveProfile
                    ? state.profile.displayName.text
                    : "-",
            backButton: false,
            actionButton: true,
          ),
          body: Stack(
            children: [
              Background.backGroundImage(context),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.padding2),
                  child: Column(
                    children: [
                      context.sbHeight(
                        size:
                            context.iMediaQuery.padding.top + context.padding10,
                      ),
                      const ProfileImage(),
                      context.sbHeight(size: context.padding3),
                      const About(),
                      context.sbHeight(size: context.padding3),
                      const Interest(),
                      context.sbHeight(
                        size: context.iMediaQuery.padding.bottom +
                            context.padding2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
