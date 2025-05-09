import 'package:flutter/material.dart';

class TermsHeadingDescription extends StatelessWidget {
  final String title;
  final String description;
  final EdgeInsetsGeometry padding;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final double spacing;

  const TermsHeadingDescription({
    super.key,
    required this.title,
    required this.description,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    this.titleStyle = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    this.descriptionStyle = const TextStyle(
      fontSize: 14,
      color: Colors.black87,
      height: 1.5,
    ),
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: titleStyle),
          SizedBox(height: spacing),
          Text(description, style: descriptionStyle),
        ],
      ),
    );
  }
}
