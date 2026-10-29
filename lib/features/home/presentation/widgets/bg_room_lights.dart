import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:int_house/main_core/shared/domain/domain.dart';
import 'package:int_house/main_core/shared/presentation/widgets/blue_dot_light.dart';
import 'package:int_house/main_core/shared/presentation/widgets/sh_divider.dart';
import 'package:ui_common/ui_common.dart';

import 'package:int_house/main_core/core.dart';

class BgRoomLights extends StatelessWidget {
  const BgRoomLights({Key? key, required this.room, required this.translation}) : super(key: key);

  final SmartRoom room;
  final double translation;

  @override
  Widget build(BuildContext context) {
    return Transform(
        transform: Matrix4.translationValues(0, 80 * translation, 0),
      child: DecoratedBox(
          decoration: const BoxDecoration(
            color: SHColors.cardColor,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 12,
                offset: Offset(-7, 7),
              ),
            ],
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _RoomInfoRow(
                icon: const Icon(SHIcons.thermostat),
                label: const Text('Temparature'),
                data: '${room.temperature}°'
            ),
            height4,
            _RoomInfoRow(
                icon: const Icon(SHIcons.waterDrop),
                label: const Text('Air Humidity'),
                data: '${room.airHumidity}%°'
            ),
            height4,
            const _RoomInfoRow(
                icon: Icon(SHIcons.timer),
                label: Text('Timer'),
                data: null,
            ),
            height12,
            const ShDivider(),
            Padding(
                padding: EdgeInsets.all(12.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _DeviceIconSwitcher(
                      label: const Text('Lights'),
                      icon: const Icon(SHIcons.lightBulbOutline),
                      value: room.lights.isOn,
                      onTap: (value) {}
                  ),
                  _DeviceIconSwitcher(
                      label: const Text('Air-Conditioning'),
                      icon: const Icon(SHIcons.fan),
                      value: room.airCondition.isOn,
                      onTap: (value) {}
                  ),
                  _DeviceIconSwitcher(
                      label: const Text('Music'),
                      icon: const Icon(SHIcons.music),
                      value: room.musicInfo.isOn,
                      onTap: (value) {}
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _DeviceIconSwitcher extends StatelessWidget{

  const _DeviceIconSwitcher({required this.label, required this.icon, required this.value, required this.onTap});

  final Text label;
  final Icon icon;
  final bool value;
  final ValueChanged<bool> onTap;

  @override
  Widget build(BuildContext context) {
    final color = value ? SHColors.selectedColor : SHColors.textColor;
    return InkWell(
      onTap: () => onTap(!value),
      child: Column(
        children: [
          IconTheme(
              data: IconThemeData(color: color, size: 24.sp),
              child: icon
          ),
          const SizedBox(height: 4),
          DefaultTextStyle(
              style: context.bodySmall.copyWith(color: color),
              child: label
          ),
          Text(
            value ? 'ON' : 'OFF',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              color: color
            ),
          ),
        ],
      ),
    );
  }

}

class _RoomInfoRow extends StatelessWidget{
  const _RoomInfoRow({ required this.icon, required this.label, required this.data});

  final Icon icon;
  final Text label;
  final String? data;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        width32,
        IconTheme(
            data: context.iconTheme.copyWith(size: 18.sp),
            child: icon,
        ),
        width4,
        Expanded(
            child: DefaultTextStyle(
                style: context.bodySmall.copyWith(
                  color: data == null ? context.textColor.withOpacity(.6) : null,
                ),
                child: label
            ),
        ),
        if (data != null)
          Text(
              data!,
            style: GoogleFonts.montserrat(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          )
        else
          Row(
            children: [
              const BlueDotLight(),
              width4,
              Text(
                  'OFF',
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w800,
                  fontSize: 12.sp,
                  color: SHColors.textColor.withOpacity(.6),
                ),
              )
            ],
          ),
        width32,
      ],
    );
  }

}
