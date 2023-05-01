import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/routes/routes.dart';
import '../../../widget/bg/background.dart';
import '../../../widget/pages/auth.dart';
import '../../../widget/text_field/text_field_primary.dart';
import '../../register/view/register_view.dart';
import '../bloc/login/bloc.dart';
import '../view_model/login_view_model.dart';

class LoginView extends StatelessWidget {
  static const String routeName = '/login';

  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(),
      child: Builder(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => LoginViewModel(),
          builder: (context, child) => _buildPage(context),
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Stack(
          children: [
            Background.backGroundImage(context),
            Container(
              width: context.mQWidth(1),
              height: context.mQHeight(1),
              padding: EdgeInsets.symmetric(horizontal: context.padding2),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    context.sbHeight(size: context.padding10 * 2.5),
                    AuthWidget.textOnTop(context, title: "Login"),
                    _textField(),
                    context.sbHeight(size: context.padding3),
                    Consumer<LoginViewModel>(
                      builder: (context, provider, child) {
                        return AuthWidget.button(
                          label: "Login",
                          disabled: provider.isInValidForm,
                          onPressed: () {
                            provider.doLogin(bloc, context);
                          },
                        );
                      },
                    ),
                    context.sbHeight(size: context.padding6),
                    AuthWidget.textOnBottom(
                      context,
                      text1: "No account? ",
                      text2: "Register here",
                      width: 83,
                      onTap: () {
                        goToNamed(context, routeName: RegisterView.routeName);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textField() {
    return Consumer<LoginViewModel>(
      builder: (context, provider, child) {
        return Column(
          children: [
            TextFieldPrimary(
              controller: provider.emailController,
              label: "",
              hintText: "Enter Username/Email",
              onChanged: (value) {
                provider.validateForm();
              },
            ),
            TextFieldPrimary(
              controller: provider.passwordController,
              label: "",
              hintText: "Password",
              isPassword: provider.isShowPassword,
              suffix: true,
              onTapSuffix: () {
                provider.showPassword();
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
