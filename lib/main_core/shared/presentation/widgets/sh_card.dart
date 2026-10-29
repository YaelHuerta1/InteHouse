import 'package:flutter/material.dart';
import 'package:int_house/main_core/shared/presentation/widgets/sh_divider.dart';
import 'package:ui_common/ui_common.dart';

import 'package:int_house/main_core/core.dart';

class ShCard extends StatelessWidget {
  const ShCard({Key? key, this.height, required this.children, required this.childrenPadding}) : super(key: key);

  final double? height;
  final List<Widget> children;
  final EdgeInsets childrenPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: SHColors.cardColors
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 20,
                offset: Offset(-10, 10),
              ),
            ],
            borderRadius: 12.borderRadiusA,
          ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int index = 0; index < children.length; index++) ...[
              Padding(
                  padding: childrenPadding,
                  child: children[index],
              ),
              if (index < children.length - 1) const ShDivider(),
            ]
          ],
        ),
      ),
    );
  }
}
