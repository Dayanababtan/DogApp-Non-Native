import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/dog_list_scree.dart';

void main() {
  runApp(const DogApp());
}

class DogApp extends StatelessWidget {
  const DogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DogListScreen(),
    );
  }
}
