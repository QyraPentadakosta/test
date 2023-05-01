import 'package:flutter/material.dart';

import 'action_primary.dart';
import 'leading_primary.dart';

class IAppBar extends AppBar {
  IAppBar({
    super.key,
    required List<Widget>? actions,
    required Widget? title,
    required Widget? leading,
  }) : super(
          title: title,
          leadingWidth: 80,
          leading: leading,
          actions: actions,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        );

  factory IAppBar.primary({
    required String title,
    required bool backButton,
    required bool actionButton,
  }) {
    return IAppBar(
      title: Text(
        title,
        textAlign: TextAlign.center,
        maxLines: 2,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: backButton ? const LeadingPrimary() : null,
      actions: actionButton
          ? [
              const ActionPrimary(),
            ]
          : [],
    );
  }
}
