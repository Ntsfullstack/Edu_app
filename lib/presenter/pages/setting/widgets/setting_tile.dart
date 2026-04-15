import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool showDivider;

  const SettingTile({
    super.key,
    required this.icon,
    required this.title,
    this.iconColor = const Color(0xFF1A6BFF),
    this.iconBgColor = const Color(0xFFEEF3FF),
    this.trailing,
    this.onTap,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 20,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF0D1B3E),
            ),
          ),
          trailing: trailing ??
              const Icon(
                Icons.chevron_right_rounded,
                color: Color(0xFFAAB4C8),
                size: 20,
              ),
        ),
        if (showDivider)
          Padding(
            padding: const EdgeInsets.only(left: 64, right: 16),
            child: Divider(
              height: 1,
              color: const Color(0xFFEEF1F8),
            ),
          ),
      ],
    );
  }
}
