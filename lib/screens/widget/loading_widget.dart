import 'package:flutter/material.dart';

Widget loadingWidget() {
  return const Center(
    child: CircularProgressIndicator(
      backgroundColor: Colors.grey,
      color: Colors.blueGrey,
    ),
  );
}
