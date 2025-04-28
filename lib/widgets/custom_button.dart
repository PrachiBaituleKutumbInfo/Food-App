import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  final bool isEnable;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color? disabledBackgroundColor;
  final Color? borderColor;
  final VoidCallback onPressed;
  final double fontSize;

  const CustomActionButton({
    super.key,
    required this.isEnable,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.disabledBackgroundColor,
    this.borderColor,
    required this.onPressed,
    this.fontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: isEnable ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnable ? backgroundColor : (disabledBackgroundColor ?? backgroundColor.withOpacity(0.5)),
          disabledBackgroundColor: disabledBackgroundColor ?? backgroundColor.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: borderColor != null ? BorderSide(color: borderColor!) : BorderSide.none,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
