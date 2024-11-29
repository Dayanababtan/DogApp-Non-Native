import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/dog_list_scree.dart';

void main() {
  runApp(DogApp());
}

class DogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DogListScreen(),
    );
  }
}
