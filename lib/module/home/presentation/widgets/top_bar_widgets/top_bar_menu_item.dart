import 'package:flutter/material.dart';

class TopBarMenuItem extends StatelessWidget {
  const TopBarMenuItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {},
        child: Icon(
          Icons.menu,
          color: Colors.white,
        ),
      ),
    );
  }
}
