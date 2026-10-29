import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:int_house/main_core/core.dart';

class MusicSwitchers extends StatelessWidget {
  const MusicSwitchers({Key? key, required this.room}) : super(key: key);

  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    return ShCard(
        childrenPadding: const EdgeInsets.all(12),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Row(
                children: [
                  Text('Music'),
                  Spacer(),
                  Icon(Icons.open_in_new_rounded),
                ],
              ),
              const SizedBox(height: 8),
              ShSwitcher(
                value: room.musicInfo.isOn,
                icon: const Icon(SHIcons.music),
                onChanged: (value) {},
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                room.musicInfo.currentS.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                room.musicInfo.currentS.artist,
                style: GoogleFonts.montserrat(
                  color: SHColors.selectedColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
              IconTheme(
                  data: const IconThemeData(size: 20, color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Flexible(child: Icon(Icons.fast_rewind)),
                      const SizedBox(width: 8),
                      Flexible(
                          child: room.musicInfo.isOn
                              ? const Icon(Icons.pause)
                              : const Icon(Icons.play_arrow),
                      ),
                      const SizedBox(width: 8),
                      const Flexible(child: Icon(Icons.fast_forward))
                    ],
                  )
              )
            ],
          )
        ],
    );
  }
}
