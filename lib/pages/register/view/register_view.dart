import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/routes/routes.dart';
import '../../../widget/appbar/app_bar_primary.dart';
import '../../../widget/bg/background.dart';
import '../../../widget/pages/auth.dart';
import '../../../widget/text_field/text_field_primary.dart';
import '../../login/view/login_view.dart';
import '../bloc/bloc.dart';
import '../view_model/register_view_model.dart';

class RegisterView extends StatelessWidget {
  static const routeName = '/register';
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterBloc(),
      child: Builder(
        builder: (context) => ChangeNotifierProvider(
          create: (BuildContext context) => RegisterViewModel(),
          child: _buildPage(context),
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<RegisterBloc>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: IAppBar.primary(
        title: "",
        backButton: true,
        actionButton: false,
      ),
      body: Stack(
        children: [
          Background.backGroundImage(context),
          Container(
            width: context.mQWidth(1),
            height: context.mQHeight(1),
            padding: EdgeInsets.symmetric(
              horizontal: context.padding2,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  context.sbHeight(size: context.padding10 * 2.5),
                  AuthWidget.textOnTop(context, title: "Register"),
                  _textField(),
                  context.sbHeight(size: context.padding3),
                  Consumer<RegisterViewModel>(
                    builder: (context, provider, child) {
                      return AuthWidget.button(
                        label: "Register",
                        disabled: provider.isInValidForm,
                        onPressed: () {
                          provider.doRegister(bloc, context);
                        },
                      );
                    },
                  ),
                  context.sbHeight(size: context.padding6),
                  AuthWidget.textOnBottom(
                    context,
                    text1: "Have an account? ",
                    text2: "Login here",
                    width: 65,
                    onTap: () {
                      goToNamed(context, routeName: LoginView.routeName);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textField() {
    return Consumer<RegisterViewModel>(
      builder: (context, provider, child) {
        return Column(
          children: [
            TextFieldPrimary(
              controller: provider.emailController,
              label: "",
              keyboardType: TextInputType.emailAddress,
              hintText: "Enter Email",
              onChanged: (value) {
                provider.validateForm();
              },
            ),
            TextFieldPrimary(
              controller: provider.userNameController,
              label: "",
              hintText: "Create Username",
              onChanged: (value) {
                provider.validateForm();
              },
            ),
            TextFieldPrimary(
              controller: provider.passwordController,
              label: "",
              hintText: "Create Password",
              isPassword: provider.isShowPassword,
              suffix: true,
              onTapSuffix: () {
                provider.showPassword();
              },
              onChanged: (value) {
                provider.validateForm();
              },
            ),
            TextFieldPrimary(
              controller: provider.confirmPasswordController,
              label: "",
              hintText: "Confirm Password",
              isPassword: provider.isShowConfirmPassword,
              suffix: true,
              onTapSuffix: () {
                provider.showConfirmPassword();
              },
              onChanged: (value) {
                provider.validateForm();
              },
            ),
          ],
        );
      },
    );
  }
}
