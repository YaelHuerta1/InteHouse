import 'package:flutter/material.dart';

import 'package:int_house/main_core/core.dart';

class LightTimerSwitcher extends StatelessWidget {
  const LightTimerSwitcher({Key? key, required this.smartRoom}) : super(key: key);

  final SmartRoom smartRoom;

  @override
  Widget build(BuildContext context) {
    return ShCard(
        childrenPadding: const EdgeInsets.all(12),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Lights'),
              const SizedBox(height: 8),
              ShSwitcher(
                  value: smartRoom.lights.isOn,
                  onChanged: (value) {},
                  icon: const Icon(SHIcons.lightBulbOutline),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text('Timer'),
                  Spacer(),
                  BlueDotLight(),
                ],
              ),
              const SizedBox(height: 8,),
              ShSwitcher(
                  icon: smartRoom.timer.isOn
                        ? const Icon(SHIcons.timer)
                        : const Icon(SHIcons.timerOff),
                  value: smartRoom.timer.isOn,
                  onChanged: (value) {},
              )
            ],
          ),
        ],
    );
  }
}
