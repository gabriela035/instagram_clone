import 'package:flutter/material.dart';
import 'package:instagram_clone/consts.dart';

class Stories extends StatelessWidget {
  final function;

  Stories({this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: secondaryColor,
          ),
        ),
      ),
    );
  }
}
