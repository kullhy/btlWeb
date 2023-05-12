import 'package:flutter/material.dart';

import 'menu_item.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MenuItem(title: 'Trang chủ'),
              MenuItem(title: 'Nhóm 1'),
              MenuItem(title: 'Liên hệ'),
              MenuItem(title: 'Trợ giúp'),
            ],
          ),
        ],
      ),
    );
  }
}