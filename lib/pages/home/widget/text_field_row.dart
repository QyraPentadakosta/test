import 'package:flutter/material.dart';

import '../../../application/shared/bottom_sheet/gender_bottom_sheet.dart';
import '../../../application/shared/date_time_picker/date_time_picker.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../widget/text_field/text_field_primary.dart';

class TextFieldRow extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final bool? selectOption;
  final bool? datePicker;
  final bool? readOnly;
  final void Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final Widget? suffixWidget;

  const TextFieldRow({
    super.key,
    required this.label,
    required this.controller,
    this.onChanged,
    required this.hintText,
    this.selectOption,
    this.datePicker,
    this.readOnly,
    this.onEditingComplete,
    this.keyboardType,
    this.suffixWidget,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: context.mQHeight(0.025),
          ),
          width: context.mQWidth(0.3),
          alignment: Alignment.bottomLeft,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.33),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              TextFieldPrimary(
                label: '',
                height: 1,
                suffixWidget: suffixWidget,
                keyboardType: keyboardType,
                readOnly: readOnly,
                controller: controller,
                onChanged: onChanged,
                hintText: hintText,
                onEditingComplete: onEditingComplete,
                hintTextDirection: TextDirection.rtl,
                onTap: selectOption == true
                    ? () async {
                        String? text = await GenderBottomSheet()
                            .showGenderBottomSheet(context);
                        if (text != null) {
                          controller.text = text;
                          return onChanged?.call(text);
                        }
                      }
                    : datePicker == true
                        ? () async {
                            String? text =
                                await DateTimePicker().pickDate(context);
                            if (text != null) {
                              controller.text = text;
                              return onChanged?.call(text);
                            }
                          }
                        : null,
              ),
            ],
          ),
        )
      ],
    );
  }
}
