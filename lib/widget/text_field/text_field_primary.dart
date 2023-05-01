import 'package:flutter/material.dart';

class TextFieldPrimary extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool? isPassword;
  final String label;
  final bool? suffix;
  final TextInputType? keyboardType;
  final void Function()? onTapSuffix;
  final void Function(String)? onChanged;
  final double? height;
  final TextDirection? hintTextDirection;
  final void Function()? onTap;
  final bool? readOnly;
  final void Function()? onEditingComplete;
  final Widget? suffixWidget;

  const TextFieldPrimary({
    this.onTap,
    this.controller,
    this.hintText,
    this.isPassword,
    this.suffix,
    this.onTapSuffix,
    this.onChanged,
    required this.label,
    super.key,
    this.keyboardType,
    this.height,
    this.hintTextDirection,
    this.readOnly,
    this.onEditingComplete,
    this.suffixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        _textField(),
      ],
    );
  }

  Widget _textField() {
    return TextField(
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      style: const TextStyle(
        color: Colors.white,
      ),
      controller: controller,
      obscureText: isPassword ?? false,
      obscuringCharacter: '*',
      onChanged: onChanged,
      readOnly: onTap != null || readOnly != null ? true : false,
      keyboardType: keyboardType ?? TextInputType.text,
      textAlign: hintTextDirection == TextDirection.rtl
          ? TextAlign.end
          : TextAlign.start,
      // textDirection: hintTextDirection ?? TextDirection.ltr,
      decoration: InputDecoration(
        hintText: hintText,
        hintTextDirection: TextDirection.ltr,
        // hintTextDirection: TextDirection.rtl,
        filled: true,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(9),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(9),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(9),
        ),
        fillColor: Colors.white.withOpacity(0.05),
        hintStyle: TextStyle(
          color: Colors.white.withOpacity(0.5),
        ),
        contentPadding: height != null
            ? const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              )
            : null,
        suffix: suffixWidget,
        suffixIcon: suffix ?? false
            ? IconButton(
                onPressed: onTapSuffix,
                icon: Icon(
                  isPassword ?? true ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white.withOpacity(0.5),
                ),
              )
            : null,
      ),
    );
  }
}
