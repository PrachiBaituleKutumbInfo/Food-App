import 'package:flutter/material.dart';
import 'package:konkan_bite_food/features/auth/theme/themeColor.dart';

class ProfileTile extends StatelessWidget {
  final Widget iconWidget;
  final String title;
  final VoidCallback? onTap;

  const ProfileTile({
    super.key,
    required this.iconWidget,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        child: iconWidget,
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
      onTap: onTap,
    );
  }
}

class SectionContainer extends StatelessWidget {
  final List<Widget> children;

  const SectionContainer({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.lightBlueGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: children,
      ),
    );
  }
}
