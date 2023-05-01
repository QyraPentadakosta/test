import 'package:flutter/material.dart';

import '../../core/extensions/context_extensions.dart';

class Background {
  static Widget backGroundImage(BuildContext context) {
    return Container(
      width: context.mQWidth(1),
      height: context.mQHeight(1),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg.png'),
          fit: BoxFit.cover,
        ),
        gradient: RadialGradient(
          colors: [
            Color.fromRGBO(31, 66, 71, 1),
            Color.fromRGBO(13, 29, 35, 1),
            Color.fromRGBO(9, 20, 26, 1),
          ],
          // tileMode: TileMode.mirror,
          // radius: 24,
          // center: Alignment.topRight,
          // focal: Alignment.bottomLeft,
        ),
      ),
    );
  }
}
