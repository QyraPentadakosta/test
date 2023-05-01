import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';

class ButtonPrimary extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final bool? disabled;

  const ButtonPrimary({
    required this.label,
    super.key,
    this.onPressed,
    this.disabled,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Container(
          width: context.mQWidth(1),
          height: 50.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            gradient: LinearGradient(
              colors: [
                Color(0xff62CDCB),
                Color(0xff4599DB),
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          alignment: Alignment.center,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              minimumSize: Size(context.mQWidth(1), 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Container(
          child: disabled ?? false
              ? Container(
                  width: context.mQWidth(1),
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                  ),
                )
              : null,
        )
      ],
    );
  }
}
