import 'package:estagio_flutter/routes/routes.dart';
import 'package:estagio_flutter/screens/details/edit_details.dart';
import 'package:estagio_flutter/screens/home/landing_page.dart';
import 'package:estagio_flutter/screens/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(
    ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.home,
          routes: {
            Routes.profile: (context) => const ProfilePage(),
            Routes.home: (context) => HomePage(cities: [], atendimentos: [],),
            Routes.details: (context) => EditDetailsPage(),
          },
        );
      }
    ));
}
