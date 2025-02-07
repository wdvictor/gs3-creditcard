import 'package:creditcard/module/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TopBarTitle extends StatelessWidget {
  const TopBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: 'Olá, ',
          style: AppTheme.textTheme.titleMedium!
              .copyWith(fontWeight: FontWeight.normal, color: Colors.white),
          children: [
            TextSpan(
              text: 'Cliente',
              style: AppTheme.textTheme.titleMedium!.copyWith(
                color: Colors.white,
              ),
            )
          ]),
    );
  }
}
