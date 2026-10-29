import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:int_house/main_core/shared/domain/entities/smart_room.dart';
import 'package:int_house/main_core/shared/presentation/widgets/parallax_image_card.dart';
import 'package:int_house/main_core/shared/presentation/widgets/sh_app_bar.dart';
import 'package:ui_common/ui_common.dart';

import 'package:int_house/main_core/shared/presentation/widgets/room_card.dart';
import 'package:int_house/features/smart_room/widgets/room_details_page_view.dart';

class RoomDetailsScreen extends StatelessWidget {
  const RoomDetailsScreen({Key? key, required this.room}) : super(key: key);

  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const ShAppBar(),
      body: RoomDetailItems(
        topPadding: context.mediaQuery.padding.top,
        room: room,
      ),
    );
  }
}

class RoomDetailItems extends StatelessWidget{

  const RoomDetailItems({super.key, this.animation = const AlwaysStoppedAnimation<double>(1), required this.topPadding, required this.room});

  final Animation<double> animation;
  final double topPadding;
  final SmartRoom room;


  @override
  Widget build(BuildContext context) {
    final outDx = 200 * animation.value;
    final outDy = 100 * animation.value;
    final sigma = 10 * animation.value;
    
   return Hero(
       tag: room.id,
       child: Stack(
         alignment: Alignment.center,
         fit: StackFit.expand,
         children: [
           ParallaxImageCard(imageUrl: room.imageUrl),
           ClipRect(
             child: BackdropFilter(
                 filter: ImageFilter.blur(sigmaY: sigma, sigmaX: sigma),
                child: const ColoredBox(color: Colors.transparent),
             ),
           ),

           //ELEMENTOS ANIMADOS
           //---------------------------
           FadeTransition(
             opacity: Tween<double>(begin: 1, end: 0).animate(animation),
             child: Stack(
               children: [
                 Transform.translate(
                     offset: Offset(-outDx, 0),
                    child: VerticalRoomTitle(room : room),
                 ),
                 Transform.translate(
                     offset: Offset(outDx, outDy),
                    child: const CameraIconButton(),
                 ),
                 Transform.translate(
                     offset: Offset(0, outDy),
                    child: const AnimatedUpwardArrows(),
                 ),
               ],
             ),
           ),

           // CONTROLES ANIMADOS //
           // -----------------------------------------
           FadeTransition(
             opacity: animation,
             child: Container(
               transform: Matrix4.translationValues(0, -200 * (1 - animation.value), 0),
               padding: EdgeInsets.only(top: topPadding + 12),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: [
                   Text(
                     room.name.replaceAll(' ', '\n'),
                     textAlign: TextAlign.center,
                     style: context.displaySmall.copyWith(height: .9),
                   ),
                   const Text('SETTINGS', textAlign: TextAlign.center),
                   Expanded(
                       child: RoomDetailsPageView(
                           animation: animation,
                           room: room
                       )
                   )
                 ],
               ),
             ),
           ),
         ],
       )
   );
  }
}
