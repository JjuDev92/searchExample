import 'package:flutter/material.dart';

class Page1Detail extends StatefulWidget {
  static String routeName = "/page1_detail1";

  const Page1Detail({Key? key}) : super(key: key);
  @override
  _Page1DetailState createState() => _Page1DetailState();
}

class _Page1DetailState extends State<Page1Detail> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Page1DetailArgs;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.collection.toUpperCase() + ' Detail'),
        iconTheme: const IconThemeData(color: Colors.cyan),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(children: [
        Image(
          image: NetworkImage(args.imageUrl),
        ),
        const SizedBox(
          height: 40,
        ),
        Text('작성 시간 : ' + args.dateTime.toString()),
      ]),
    );
  }
}

class Page1DetailArgs {
  final String imageUrl;
  final String collection;
  final String docUrl;
  final DateTime dateTime;

  Page1DetailArgs({
    required this.imageUrl,
    required this.collection,
    required this.docUrl,
    required this.dateTime,
  });
}

// class Page1WebviewArgs {
//   final String docUrl;

//   Page1WebviewArgs({
//     required this.docUrl,
//   });
// }
