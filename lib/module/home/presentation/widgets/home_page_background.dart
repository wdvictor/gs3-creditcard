import 'package:creditcard/module/app/core/extensions/build_context_extensions.dart';
import 'package:creditcard/module/app/core/theme/app_theme.dart';
import 'package:creditcard/module/home/presentation/widgets/top_bar_widgets/top_bar.dart';
import 'package:flutter/material.dart';

class HomePageBackground extends StatelessWidget {
  const HomePageBackground({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      height: context.screenHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppTheme.lightBlue,
            Colors.white10,
            Colors.white12,
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [TopBar(), child],
        ),
      ),
    );
  }
}
