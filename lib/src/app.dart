import 'package:flutter/material.dart';
import 'package:thinkpad/src/res/string.dart';
import 'package:thinkpad/src/view/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true
      ),
      title: AppStrings.appName,
      home: HomeView(),
    );
  }
}