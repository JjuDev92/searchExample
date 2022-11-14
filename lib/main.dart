import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'providers/bottom_tab_provider.dart';
import 'router/route_list.dart';
import 'viewmodel/search_image_model.dart';

void main() {
  runApp(ChangeNotifierProvider.value(
    // SearchImageModel(ViewModel 값을 MyApp한테 전달.)
    // NotifierListeners 호출되면 쓰고자 하는 곳에 알려줄 수 있음
    value: SearchImagesModel(''),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomTabProvider>(
          create: (_) => BottomTabProvider(),
        ),
      ],
      builder: (context, child) {
        return GetMaterialApp(
          // title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.red,
            fontFamily: 'Noto_Serif_KR',
          ),
          initialRoute: '/',
          routes: routes,
        );
      },
    );
  }
}
