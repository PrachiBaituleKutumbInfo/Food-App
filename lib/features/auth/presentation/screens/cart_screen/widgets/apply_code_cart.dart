import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';

class CardTextField extends StatelessWidget {
  final String hintText;
  final bool isMultiline;
  final VoidCallback? onButtonPressed;
  final String? buttonText;
  final Color backgroundColor;
  final TextEditingController? controller;

  const CardTextField({
    super.key,
    required this.hintText,
    this.isMultiline = false,
    this.onButtonPressed,
    this.buttonText,
    this.backgroundColor = AppColors.lightBlueGrey,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.grey),
    );

    return TextField(
      controller: controller,
      minLines: isMultiline ? 3 : 1,
      maxLines: isMultiline ? 10 : 1,
      textAlignVertical: isMultiline ? null : TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.softBlue,
        ),
        filled: true,
        fillColor: backgroundColor,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: const BorderSide(color: AppColors.softBlue, width: 2),
        ),
        suffixIcon: (onButtonPressed != null && buttonText != null)
            ? Container(
                margin: const EdgeInsets.only(right: 0),
                child: ElevatedButton(
                  onPressed: onButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: Text(
                    buttonText!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
