import 'package:flutter/cupertino.dart';

import '../bloc/bloc.dart';
import '../bloc/event.dart';

class RegisterViewModel extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isInValidForm = true;
  bool isShowPassword = true;
  bool isShowConfirmPassword = true;

  void showPassword() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  void showConfirmPassword() {
    isShowConfirmPassword = !isShowConfirmPassword;
    notifyListeners();
  }

  void validateForm() {
    if (emailController.text.isNotEmpty &&
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(emailController.text) &&
        userNameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        passwordController.text == confirmPasswordController.text) {
      isInValidForm = false;
      notifyListeners();
    } else {
      isInValidForm = true;
      notifyListeners();
    }
  }

  Future doRegister(RegisterBloc bloc, BuildContext context) async {
    bloc.add(DoRegister(
      context,
      email: emailController.text,
      password: passwordController.text,
      userName: userNameController.text,
    ));
  }
}
