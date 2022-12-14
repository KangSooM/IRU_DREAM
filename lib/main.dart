import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drawing3/screens/drawing_page/local_utils/DrawingProvider.dart';
import 'package:drawing3/screens/drawing_page/drawing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => DrawingProvider(),
        child: const DrawingPage(),
      ),
    );
  }
}
