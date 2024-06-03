import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:projectoneuniversity/core/constants/colors.dart';
import '../functions/valid_input.dart';

class Customtextformfiled extends StatelessWidget {
  final String hintText;
  final String labelText;
  final IconData? iconData;
  final TextEditingController? controller;
  final int min;
  final int max;
  final bool isNumber;
  final bool isPassword;
  final bool isBorder;
  final int maxLines;
  final int? minLines;
  final int? letters;
  final bool isFilled;
  final bool? isEnabled;
  final bool isLabel;
  final TextInputType? textInputType;
  final void Function()? ontapicon;
  final void Function(String val)? onChange;
  final double? padding;
  final TextInputAction? textInputAction;
  final TextStyle? styleText;

  final bool isValidation;
  final FocusNode? focusNode;
  Customtextformfiled({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.iconData,
    required this.controller,
    required this.min,
    required this.max,
    required this.isNumber,
    required this.isPassword,
    this.ontapicon,
    this.isBorder = true,
    this.maxLines = 1,
    this.letters,
    this.isLabel = true,
    this.padding = 20,
    this.isFilled = false,
    this.isValidation = true,
    this.focusNode,
    this.onChange,
    this.minLines,
    this.textInputAction,
    this.textInputType,
    this.isEnabled = true,
    this.styleText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: padding!.h, left: padding! / 2.w, right: padding! / 2.w),
      decoration: isFilled
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.primaryContainer,
            )
          : null,
      child: TextFormField(
        obscureText: isPassword,
        style: styleText != null
            ? styleText
            : TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
                fontSize: 15.sp),
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : textInputAction == TextInputAction.newline
                ? TextInputType.multiline
                : TextInputType.text,
        focusNode: focusNode,
        textInputAction: textInputAction,
        validator: isValidation
            ? (val) {
                return validInput(val!, min, max);
              }
            : null,
        enabled: isEnabled,
        maxLength: letters,
        minLines: minLines,
        controller: controller,
        maxLines: maxLines,
        onChanged: onChange,
        decoration: InputDecoration(
            enabled: true,
            hintText: hintText,
            border: isBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                : InputBorder.none,
            labelStyle: TextStyle(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            label: isLabel
                ? Container(
                    margin: const EdgeInsets.only(left: 5, right: 5),
                    child: Text(
                      labelText,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  )
                : null,
            suffixIcon: iconData != null
                ? GestureDetector(
                    onTap: ontapicon,
                    child: Container(
                      child: Icon(
                        iconData,
                        color: !isPassword && ontapicon != null
                            ? Colors.red
                            : Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  )
                : null,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: LightAppColors.primaryColor),
            )),
      ),
    );
  }
}
