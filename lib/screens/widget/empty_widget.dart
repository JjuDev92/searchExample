import 'package:flutter/material.dart';

import '../../assets/assets.dart';

Widget emptyWidget() {
  return Center(
    child: Column(children: [
      Container(
        margin: const EdgeInsets.only(top: 200),
        width: 100,
        height: 100,
        child: Image.asset(Assets.noResult),
      ),
      const SizedBox(
        height: 20,
      ),
      const Text(
        '올바른 검색어를 입력해주세요.',
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
    ]),
  );
}
