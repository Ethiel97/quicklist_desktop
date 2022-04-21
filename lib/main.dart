import 'package:flutter/material.dart';
import 'package:flutter_desktop_2/utils/text_styles.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';
import 'pages/dashboard.dart';
import 'startup.dart';

void main() async {
  await Startup.run();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'Quicklist',
        theme: ThemeData(
          textTheme: GoogleFonts.dmSansTextTheme(
            Theme.of(context).textTheme,
          ),
          fontFamily: TextStyles.primary.fontFamily,
          primarySwatch: Colors.blue,
          backgroundColor: backgroundColor,
        ),
        home: const SafeArea(
          child: Dashboard(),
        ),
        debugShowCheckedModeBanner: false,
      );
}
