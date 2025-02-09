import 'package:creditcard/module/cards/presentation/cards_page.dart';
import 'package:creditcard/module/home/controllers/bottom_bar_controller.dart';
import 'package:creditcard/module/home/domain/enums/bottom_nav_bar_type.dart';
import 'package:creditcard/module/home/presentation/widgets/home_page_background.dart';
import 'package:creditcard/module/home/presentation/widgets/bottom_bar_widgets/app_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = BottomBarController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageBackground(
        child: ValueListenableBuilder(
          valueListenable: _controller,
          builder: (context, type, child) {
            if (type == BottomNavBarType.home) {
              return CardsPage();
            }
            if (type == BottomNavBarType.fatura) {
              return Center(
                child: Text('Fatura'),
              );
            }
            if (type == BottomNavBarType.cartao) {
              return Center(
                child: Text('cartão'),
              );
            }
            if (type == BottomNavBarType.shop) {
              return Center(
                child: Text('shop'),
              );
            }

            return Text('Error');
          },
        ),
      ),
      bottomNavigationBar: AppBottomNavBar(
        controller: _controller,
      ),
    );
  }
}
