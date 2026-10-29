import 'package:flutter/material.dart';

class BlueDotLight extends StatelessWidget {
  const BlueDotLight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox.square(
      dimension: 8,
      child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.cyan,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.cyan,
                blurRadius: 10
              )
            ]
          )
      ),
    );
  }
}
