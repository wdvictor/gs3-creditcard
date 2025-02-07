import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBarOptions extends StatelessWidget {
  const TopBarOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Icon(
            CupertinoIcons.chat_bubble,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: Badge.count(
            count: 3,
            backgroundColor: Colors.blue,
            child: Icon(
              CupertinoIcons.bell,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
