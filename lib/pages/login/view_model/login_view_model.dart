import 'package:flutter/material.dart';

import '../bloc/login/bloc.dart';
import '../bloc/login/event.dart';

class LoginViewModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isShowPassword = true;

  bool isInValidForm = true;

  void showPassword() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  void validateForm() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      isInValidForm = false;
      notifyListeners();
    } else {
      isInValidForm = true;
      notifyListeners();
    }
  }

  void doLogin(LoginBloc bloc, BuildContext context) {
    bloc.add(
      DoLoginEvent(
        context,
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }
}
