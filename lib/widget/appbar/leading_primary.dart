import 'package:flutter/material.dart';

import '../../core/routes/routes.dart';

class LeadingPrimary extends StatelessWidget {
  const LeadingPrimary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
      ),
      child: InkWell(
        onTap: () {
          goBack(context);
        },
        child: Row(
          children: const [
            Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            Text(
              "Back",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
