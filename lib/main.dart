import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screen/newsScreen.dart';
import '../providers/newsProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => NewsProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: NewsScreen(),
      ),
    );
  }
}
