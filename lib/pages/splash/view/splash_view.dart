import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/splash_view_model.dart';

class SplashView extends StatelessWidget {
  static const String routeName = '/';

  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SplashViewModel>(
      create: (context) => SplashViewModel(context),
      builder: (context, child) => body(context),
    );
  }

  Widget body(BuildContext context) {
    return Consumer<SplashViewModel>(
      builder: (context, provider, child) {
        return Scaffold(
          body: Image.asset(
            'assets/bg.png',
          ),
        );
      },
    );
  }
}
