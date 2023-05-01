import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';
import '../button/button_primary.dart';

class AuthWidget {
  static Widget textOnTop(BuildContext context, {required String title}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.padding2,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  static Widget button({
    required String label,
    required bool disabled,
    required void Function()? onPressed,
  }) {
    return ButtonPrimary(
      label: label,
      disabled: disabled,
      onPressed: onPressed,
    );
  }

  static Widget textOnBottom(
    BuildContext context, {
    required String text1,
    required String text2,
    required void Function()? onTap,
    required double width,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Text(
                text2,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: [
                        Color(0xffF3EDA6),
                        Color(0xffF8FAE5),
                        Color(0xffFFE2BE),
                        Color(0xffD5BE88),
                        Color(0xffF8FAE5),
                        Color(0xffD5BE88),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ).createShader(
                      const Rect.fromLTWH(
                        0.0,
                        0.0,
                        200.0,
                        100.0,
                      ),
                    ),
                ),
              ),
              Container(
                height: 1,
                width: width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffF3EDA6),
                      Color(0xffF8FAE5),
                      Color(0xffFFE2BE),
                      Color(0xffD5BE88),
                      Color(0xffF8FAE5),
                      Color(0xffD5BE88),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
