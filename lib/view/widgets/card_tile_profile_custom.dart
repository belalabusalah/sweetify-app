import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? backgroundColor;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.onTap,
    this.iconColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.cardColor, // 👈 DEFAULT + THEME
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: iconColor ?? theme.colorScheme.primary, // 👈 THEME fallback
        ),
        title: Text(
          title,
          style: theme.textTheme.bodyLarge,
        ),
        subtitle: subtitle != null
            ? Text(
          subtitle!,
          style: theme.textTheme.bodySmall,
        )
            : null,
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: theme.iconTheme.color,
        ),
        onTap: onTap,
      ),
    );
  }
}