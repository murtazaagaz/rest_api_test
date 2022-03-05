import 'package:flutter/material.dart';

class MyProgressBar extends StatelessWidget {
  const MyProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
