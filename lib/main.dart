import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocking_examle/home.dart';



void main() {
  runApp(const LocoApp());
}

class LocoApp extends StatelessWidget {
  const LocoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
