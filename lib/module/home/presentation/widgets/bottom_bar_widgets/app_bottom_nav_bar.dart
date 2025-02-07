import 'package:creditcard/module/home/controllers/bottom_bar_controller.dart';
import 'package:creditcard/module/home/domain/enums/bottom_nav_bar_type.dart';
import 'package:creditcard/module/home/presentation/widgets/bottom_bar_widgets/custom_app_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'bottom_nav_bar_item.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({super.key, required this.controller});
  final BottomBarController controller;
  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAppNavBar(
      child: ValueListenableBuilder(
        valueListenable: widget.controller,
        builder: (context, type, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: BottomNavBarItem(
                  label: 'Home',
                  icon: CupertinoIcons.home,
                  onTap: () => widget.controller.onChangeType(
                    BottomNavBarType.home,
                  ),
                  enabled: type == BottomNavBarType.home,
                ),
              ),
              Flexible(
                child: BottomNavBarItem(
                  label: 'Fatura',
                  icon: CupertinoIcons.doc_text,
                  onTap: () => widget.controller.onChangeType(
                    BottomNavBarType.fatura,
                  ),
                  enabled: type == BottomNavBarType.fatura,
                ),
              ),
              Flexible(
                child: BottomNavBarItem(
                  label: 'Cartão',
                  icon: CupertinoIcons.creditcard,
                  onTap: () => widget.controller.onChangeType(
                    BottomNavBarType.cartao,
                  ),
                  enabled: type == BottomNavBarType.cartao,
                ),
              ),
              Flexible(
                child: BottomNavBarItem(
                  label: 'Shop',
                  icon: CupertinoIcons.bag,
                  onTap: () => widget.controller.onChangeType(
                    BottomNavBarType.shop,
                  ),
                  enabled: type == BottomNavBarType.shop,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
