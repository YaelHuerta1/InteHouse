import 'package:flutter/material.dart';

import 'package:int_house/main_core/core.dart';

class LightIntensitySliderCard extends StatelessWidget {
  const LightIntensitySliderCard({Key? key, required this.room}) : super(key: key);

  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    return ShCard(
        childrenPadding: const EdgeInsets.all(12),
        children: [
          _LightSwitcher(room: room),
          Row(
            children: [
              const Icon(SHIcons.lightMin),
              Expanded(
                  child: Slider(
                      value: .2,
                      onChanged: (value) {},
                  ),
              ),
              const Icon(SHIcons.lightMax)
            ],
          )
        ],
    );
  }
}

class _LightSwitcher extends StatelessWidget {
  const _LightSwitcher({
    required this.room,
  });

  final SmartRoom room;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
       const Flexible(
           child: FittedBox(
             fit: BoxFit.scaleDown,
             child: Text('Light Intensity'),
           ),
       ),
       Flexible(
           child: FittedBox(
             fit: BoxFit.scaleDown,
             child: Text('${room.lights.value}%', style: const TextStyle(fontSize: 20),
             ),
           ),
       ),
       ShSwitcher(
           value: room.lights.isOn,
           onChanged: (value) {},
       ),
     ],
   );
  }
}
