import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nte/core/utils/getsize.dart';

import '../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.prefixWidget,
    this.suffixIcon,
    required this.title,
    required this.textInputType,
    this.minLine = 1,
    this.isPassword = false,
    this.validatorMessage = '',
    this.controller,
    this.imageColor = Colors.grey,
    required this.backgroundColor,
    this.isEnable = true,
    this.onchange,
    this.contentPadding =
        const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
  }) : super(key: key);
  final Widget? prefixWidget;
  final Widget? suffixIcon;
  final Color imageColor;
  final Color backgroundColor;
  final String title;
  final String validatorMessage;
  final int minLine;
  final bool isPassword;
  final bool? isEnable;
  final Function(String)? onchange;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final EdgeInsetsGeometry contentPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: isPassword,
        enabled: isEnable,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontFamily: 'Cairo',
        ),
        decoration: InputDecoration(
          contentPadding: contentPadding,
          hintStyle: TextStyle(
            color: AppColors.gray6,
            fontWeight: FontWeight.w400,
          ),
          hintText: title,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(getSize(context) / 8),
            borderSide: BorderSide(color: AppColors.buttonColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(getSize(context) / 8),
            borderSide: BorderSide(color: AppColors.buttonColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(getSize(context) / 8),
            borderSide: BorderSide(color: AppColors.buttonColor),
          ),
          prefixIcon: prefixWidget,
          suffixIcon: suffixIcon,
          suffixIconColor: AppColors.buttonColor,
          prefixIconColor: AppColors.buttonColor,
          fillColor: backgroundColor,
          filled: true,
        ),
        onChanged: onchange,
        maxLines: isPassword ? 1 : 20,
        minLines: minLine,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validatorMessage;
          }
          return null;
        },
      ),
    );
  }
}

class ThousandsSeparatorInputFormatter extends TextInputFormatter {
  static const separator = ','; // Change this to '.' for other locales

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Short-circuit if the new value is empty
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    }

    // Handle "deletion" of separator character
    String oldValueText = oldValue.text.replaceAll(separator, '');
    String newValueText = newValue.text.replaceAll(separator, '');

    if (oldValue.text.endsWith(separator) &&
        oldValue.text.length == newValue.text.length + 1) {
      newValueText = newValueText.substring(0, newValueText.length - 1);
    }

    // Only process if the old value and new value are different
    if (oldValueText != newValueText) {
      int selectionIndex =
          newValue.text.length - newValue.selection.extentOffset;
      final chars = newValueText.split('');

      String newString = '';
      for (int i = chars.length - 1; i >= 0; i--) {
        if ((chars.length - 1 - i) % 4 == 0 && i != chars.length - 1)
          newString = separator + newString;
        newString = chars[i] + newString;
      }

      return TextEditingValue(
        text: newString.toString(),
        selection: TextSelection.collapsed(
          offset: newString.length - selectionIndex,
        ),
      );
    }

    // If the new value and old value are the same, just return as-is
    return newValue;
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue previousValue,
    TextEditingValue nextValue,
  ) {
    var inputText = nextValue.text;

    if (nextValue.selection.baseOffset == 0) {
      return nextValue;
    }

    var bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return nextValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}
