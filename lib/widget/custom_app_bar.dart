import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onMenuTap;
  final bool showMenu;

  // Custom action
  final IconData actionIcon;
  final VoidCallback? onActionTap;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onMenuTap,
    this.showMenu = true,
    this.actionIcon = Icons.notifications_none,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox( height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10,
            children: [
              if (showMenu)
                IconButton(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.center,
                    onPressed: onMenuTap,
                    icon: const Icon(Icons.menu),
                  ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              onPressed: onActionTap,
              icon: Icon(
                actionIcon,
                color: colors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
