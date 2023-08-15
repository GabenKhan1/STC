import 'package:flutter/material.dart';
import 'package:stc_flutter/core/colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    Key? key,
    this.labelText,
    this.textEditingController,
    this.keyboardType,
    this.maxLines = 1,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.obscureText = false,
    this.enabled,
    this.onChanged,
    this.blurRadius,
    this.elevation,
    this.hintText,
  }) : super(key: key);

  final String? labelText;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool? enabled;
  final void Function(String)? onChanged;
  final double? blurRadius;
  final double? elevation;
  final String? hintText;

  // final InputBorder bordersStyle = const OutlineInputBorder(
  //   borderRadius: BorderRadius.all(Radius.circular(16)),
  //   borderSide: BorderSide(color: Colors.white),
  // );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: textEditingController,
      keyboardType: keyboardType,
      maxLines: maxLines,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: labelText,
        labelStyle: TextStyle(
          color: black,
          fontSize: 16,
        ),
        hintText: hintText,
        // alignLabelWithHint: true,
        // border: bordersStyle,
        // enabledBorder: bordersStyle,
        // focusedBorder: bordersStyle,
        // disabledBorder: bordersStyle,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
