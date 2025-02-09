import 'package:creditcard/module/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({super.key, required this.icon, required this.title, required this.onTap});
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Icon(
              icon,
              color: AppTheme.mediumBlue,
              size: 40,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: AppTheme.textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
