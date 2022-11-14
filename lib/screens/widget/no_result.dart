import 'package:flutter/material.dart';

import '../../assets/assets.dart';

Widget noResultWidget() {
  return Center(
    child: Column(children: [
      Container(
        margin: const EdgeInsets.only(top: 200),
        width: 100,
        height: 100,
        child: Image.asset(Assets.empty),
      ),
      const SizedBox(
        height: 20,
      ),
      const Text(
        '즐겨찾기가 없어요. 배고픕니다!',
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
    ]),
  );
}
