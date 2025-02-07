import 'package:creditcard/module/app/core/extensions/build_context_extensions.dart';
import 'package:creditcard/module/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class BottomNavBarItem extends StatefulWidget {
  const BottomNavBarItem({
    super.key,
    required this.label,
    required this.icon,
    required this.enabled,
    this.onTap,
  });

  final String label;
  final IconData icon;
  final bool enabled;
  final Function()? onTap;

  @override
  State<BottomNavBarItem> createState() => _BottomNavBarItemState();
}

class _BottomNavBarItemState extends State<BottomNavBarItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            size: widget.enabled ? AppTheme.iconButton : AppTheme.iconButton / 1.1,
            color: widget.enabled ? AppTheme.darkBlue : Colors.grey,
          ),
          SizedBox(
            height: AppTheme.spacingXxs,
          ),
          Text(
            widget.label,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            textScaler: TextScaler.linear(widget.enabled ? 1 : .75),
            style: TextStyle(
                fontFamily: AppTheme.primaryFontFamily,
                color: widget.enabled ? Colors.blue : Colors.grey,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
