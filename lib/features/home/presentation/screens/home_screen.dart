import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:int_house/main_core/core.dart';
import 'package:ui_common/ui_common.dart';

import 'package:int_house/features/home/presentation/widgets/lighted_bg.dart';
import 'package:int_house/features/home/presentation/widgets/page_indicator.dart';
import 'package:int_house/features/home/presentation/widgets/home_bottom_navigation.dart';
import 'package:int_house/features/home/presentation/widgets/smart_room_page_view.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final controller = PageController(viewportFraction: 0.8);
  final ValueNotifier<double> pageNotifier = ValueNotifier(0);
  final ValueNotifier<int> roomSelectorNotifier = ValueNotifier(-1);

  @override
  void initState() {
    controller.addListener(pageListener);
    super.initState();
  }

  @override
  void dispose() {
    controller
      ..removeListener(pageListener)
      ..dispose();
    super.dispose();
  }

  void pageListener() {
    pageNotifier.value = controller.page ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return LightedBg(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const ShAppBar(),
          body: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  Text('SELECT A ROOM', style: context.bodyLarge),
                  height32,
                  Expanded(
                      child: Stack(
                        fit: StackFit.expand,
                        clipBehavior: Clip.none,
                        children: [
                          SmartRoomPageView(
                            pageNotifier: pageNotifier,
                            roomSelectorNotifier: roomSelectorNotifier,
                            controller: controller,
                          ),
                          Positioned.fill(
                              top: null,
                              child: Column(
                                children: [
                                  PageIndicator(
                                      pageNotifier: pageNotifier,
                                      roomSelectorNotifier: roomSelectorNotifier
                                  ),
                                  HomeBottomNavigation(roomSelectNotifier: roomSelectorNotifier),
                                ],
                              )
                          ),
                        ],
                      )
                  )
                ],
              )
          ),
        )
    );
  }
}
