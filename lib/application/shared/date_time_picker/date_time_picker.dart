import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/extensions/context_extensions.dart';
import '../format/date_format.dart';

class DateTimePicker {
  Future<String?> pickDate(BuildContext context) async {
    if (Platform.isIOS) {
      DateTime? picked;
      await showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) {
          DateTime? datePick = DateTime.now();
          return Container(
            height: 300,
            color: CupertinoColors.systemBackground.resolveFrom(context),
            child: Column(
              children: [
                Expanded(
                  // height: 200,
                  child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    mode: CupertinoDatePickerMode.date,
                    maximumYear: DateTime.now().year,
                    use24hFormat: true,
                    onDateTimeChanged: (DateTime newDate) {
                      datePick = newDate;
                    },
                  ),
                ),
                CupertinoButton(
                  child: const Text('OK'),
                  onPressed: () {
                    picked = datePick;
                    // print(picked);
                    Navigator.pop(context, picked);
                  },
                ),
                context.sbHeight(
                  size: context.iMediaQuery.padding.bottom != 0
                      ? context.padding2
                      : context.padding2,
                ),
              ],
            ),
          );
        },
      );
      if (picked != null) {
        var date = picked.toString().split(" ")[0];
        return DateFormat.format(date);
      }
      return null;
    } else {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        confirmText: "OK",
      );
      if (picked != null) {
        var date = picked.toString().split(" ")[0];
        return DateFormat.format(date);
      }
      return null;
    }
  }

  Future<TimeOfDay?> pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      return picked;
    }
    return null;
  }
}
