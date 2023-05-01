import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constant/constant.dart';
import '../../core/extensions/context_extensions.dart';
import '../../core/routes/routes.dart';
import '../../pages/login/view/login_view.dart';

class ActionPrimary extends StatelessWidget {
  final void Function()? onPressed;

  const ActionPrimary({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padding2),
      child: InkWell(
        onTap: () {
          IStorage.clearAll();
          goToNamed(context, routeName: LoginView.routeName);
        },
        child: Image.asset(
          'assets/button.png',
          width: 24,
          height: 8,
        ),
      ),
    );
  }
}
