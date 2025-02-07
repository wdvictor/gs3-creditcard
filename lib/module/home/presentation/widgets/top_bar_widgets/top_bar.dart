import 'package:creditcard/module/home/presentation/widgets/top_bar_widgets/top_bar_menu_item.dart';
import 'package:creditcard/module/home/presentation/widgets/top_bar_widgets/top_bar_options.dart';
import 'package:creditcard/module/home/presentation/widgets/top_bar_widgets/top_bar_title.dart';

import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white, width: 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: TopBarMenuItem()),
          Expanded(child: TopBarTitle()),
          Expanded(child: TopBarOptions())
        ],
      ),
    );
  }
}
