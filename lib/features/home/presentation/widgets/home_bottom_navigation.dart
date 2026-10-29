import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:int_house/main_core/core.dart';

class HomeBottomNavigation extends StatelessWidget {
  const HomeBottomNavigation({Key? key, required this.roomSelectNotifier}) : super(key: key);

  final ValueNotifier<int> roomSelectNotifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: ValueListenableBuilder<int>(
            valueListenable: roomSelectNotifier,
            builder: (_, value, child) => AnimatedOpacity(
                duration: kThemeAnimationDuration,
              opacity: value != -1 ? 0 : 1,
              child: AnimatedContainer(
                  duration: kThemeAnimationDuration,
                transform: Matrix4.translationValues(0, value != -1 ? -30.0 : 0.0, 0),
                child: child,
              ),
            ),
          child: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Padding(
                        padding: EdgeInsets.all(8),
                      child: Icon(SHIcons.lock),
                    ),
                  label: 'UNLOCK'
                ),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(SHIcons.home),
                    ),
                    label: 'MAIN'
                ),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(SHIcons.settings),
                    ),
                    label: 'SETTINGS'
                ),
              ]
          ),
        ),
    );
  }
}
