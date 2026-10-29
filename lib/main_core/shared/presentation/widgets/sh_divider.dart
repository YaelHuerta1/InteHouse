import 'package:flutter/material.dart';
import 'package:ui_common/ui_common.dart';

import 'package:int_house/main_core/core.dart';

class ShDivider extends StatelessWidget {
  const ShDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: const BoxDecoration(
          color: SHColors.backgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              color: Colors.white54,
              offset: Offset(0, 1),
            )
          ],
        ),
      child: SizedBox(height: 1.r, width: double.infinity),
    );
  }
}
