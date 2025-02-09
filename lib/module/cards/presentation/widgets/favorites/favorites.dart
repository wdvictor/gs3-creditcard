import 'package:creditcard/module/app/core/theme/app_theme.dart';
import 'package:creditcard/module/cards/presentation/widgets/favorites/favorite_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Meus Favoritos',
                style: AppTheme.textTheme.titleMedium,
              ),
              const Spacer(),
              Text(
                'Personalizar',
                style: AppTheme.textTheme.bodySmall!.copyWith(
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(
                Icons.grid_view,
                size: 30,
                color: Colors.blue,
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: ListView(
              addAutomaticKeepAlives: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                FavoriteItem(
                  icon: CupertinoIcons.creditcard,
                  title: 'Cartão virtual',
                  onTap: () {},
                ),
                FavoriteItem(
                  icon: Icons.add,
                  title: 'Cartão adicional',
                  onTap: () {},
                ),
                FavoriteItem(
                  icon: Icons.security_outlined,
                  title: 'Seguros',
                  onTap: () {},
                ),
                FavoriteItem(
                  icon: Icons.card_giftcard_outlined,
                  title: 'Pacotes',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
