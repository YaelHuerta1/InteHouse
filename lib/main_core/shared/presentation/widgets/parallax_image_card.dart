import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:int_house/main_core/theme/sh_colors.dart';
import 'package:ui_common/ui_common.dart';

class ParallaxImageCard extends StatelessWidget {
  const ParallaxImageCard({Key? key, required this.imageUrl, this.parallaxValue = 0}) : super(key: key);

  final String imageUrl;
  final double parallaxValue;

  BoxDecoration get _parallaxUrlImageDecoration => BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(12)),
    color: SHColors.hintColor,
    boxShadow: const [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 12,
        offset: Offset(-7, 7)
      ),
    ],
    image: DecorationImage(
        image: AssetImage(imageUrl),
        fit: BoxFit.cover,
        colorFilter: const ColorFilter.mode(Colors.black26, BlendMode.colorBurn),
        alignment: Alignment(lerpDouble(.5, -5, parallaxValue)!, 0),
    )
  );

  BoxDecoration get _vignetteDecoration => BoxDecoration(
    borderRadius: 12.borderRadiusA,
    gradient: const RadialGradient(radius:2, colors: [Colors.transparent, Colors.black])
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
        fit: StackFit.expand,
      children: [
        DecoratedBox(decoration: _parallaxUrlImageDecoration),
        DecoratedBox(decoration: _vignetteDecoration)
      ],
    );
  }
}
