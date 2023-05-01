import 'package:flutter/material.dart';

import '../../application/constant/constant.dart';

extension ISizeExtensions on BuildContext {
  //======= Size =========
  MediaQueryData get iMediaQuery => MediaQuery.of(this);

  Size get iSize => MediaQuery.of(this).size;

  double get padding0 => IConstant.padding / 2;

  double get padding1 => IConstant.padding * 1;

  double get padding2 => IConstant.padding * 2;

  double get padding3 => IConstant.padding * 3;

  double get padding4 => IConstant.padding * 4;

  double get padding5 => IConstant.padding * 5;

  double get padding6 => IConstant.padding * 6;

  double get padding7 => IConstant.padding * 7;

  double get padding8 => IConstant.padding * 8;

  double get padding9 => IConstant.padding * 9;

  double get padding10 => IConstant.padding * 10;

  double mQWidth(double number) => iSize.width * number;

  double mQHeight(double number) => iSize.height * number;

  Widget sbHeight({double? size}) {
    return SizedBox(height: size ?? padding2);
  }

  Widget sbWidth({double? size}) {
    return SizedBox(width: size ?? padding2);
  }

  void iShowSnackBar(
      {required String title,
      String subTitle = "",
      Widget? action,
      bool success = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(0),
        backgroundColor: success ? Colors.green : Colors.red,
        content: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(padding2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    subTitle.isEmpty
                        ? const SizedBox()
                        : Text(
                            subTitle,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(this).hideCurrentSnackBar();
              },
              child: Padding(
                padding: EdgeInsets.all(padding2),
                child: const Icon(
                  Icons.close,
                  color: Colors.black54,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
