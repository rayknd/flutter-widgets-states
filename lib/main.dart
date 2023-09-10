import 'package:flutter/material.dart';
import 'package:widgets_state/form.dart';
import 'package:widgets_state/principle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const PrincipalWidget(),
        "/add": (context) => FormWidget(),
      },
      initialRoute: "/",
    );
  }
}
