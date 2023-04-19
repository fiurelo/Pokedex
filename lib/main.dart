import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/views/widgets/detail_page.dart';

import 'views/home_page.dart';
//import 'utils/palette.dart';
import 'utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 979), //const
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: pokeFlutterTheme,
          home: const HomePage(),
          routes: {
            "detail_page": (context) => const DetailPage(), //const
          },
        );
      },
    );
  }
}
