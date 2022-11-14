import 'dart:async';

import 'package:flutter/material.dart';
import 'package:searchExample/screens/widget/loading_widget.dart';
import '../../assets/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routeName = "/";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int count = 5;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (count == 0) {
          dispose();

          Navigator.pushNamed(context, '/main');
        } else {
          setState(() {
            count--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
            alignment: Alignment.center,
            child: Container(
                padding: const EdgeInsets.only(top: 60),
                child: Text(
                  "Starts after $count seconds",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.lightBlue.withOpacity(0.7),
                    fontSize: 20.0,
                    decoration: TextDecoration.none,
                    fontStyle: FontStyle.normal,
                  ),
                ))),
        loadingWidget(),
      ],
    );
  }
}
