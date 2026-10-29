import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:int_house/features/home/presentation/screens/home_screen.dart';
import 'package:int_house/main_core/core.dart';


class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Smart Home',
          theme: SHTheme.dark,
          home: const HomeScreen(),
        );
      },
    );
  }
}
