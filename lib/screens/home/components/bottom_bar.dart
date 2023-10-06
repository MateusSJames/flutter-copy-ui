import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:estagio_flutter/screens/home/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
          backgroundColor: const Color(0xfff3f3f3),
          color: const Color(0xFF4E97FE),
          height: 7.h,
          activeColor: const Color(0xFF4E97FE),
          items: [
            TabItem(
              icon: Icon(
                Icons.location_on_outlined,
                color: Colors.grey,
                size: 3.5.vmax,
              ),
              activeIcon: Icon(
                Icons.location_on_outlined,
                color: const Color(0xFF4E97FE),
                size: 3.5.vmax,
              ),
            ),
            TabItem(
              icon: Icon(
                Icons.search,
                color: Colors.grey,
                size: 3.5.vmax,
              ),
            ),
            TabItem(
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 3.5.vmax,
              ),
            ),
            TabItem(
              icon: Icon(
                Icons.notifications,
                color: Colors.grey,
                size: 3.5.vmax,
              ),
            ),
            TabItem(
              icon: Icon(
                Icons.mail_sharp,
                color: Colors.grey,
                size: 3.5.vmax,
              ),
            ),
          ],
          initialActiveIndex: selectedPage,
          onTap: (int index) {},
          curve: Curves.easeInSine,
          style: TabStyle.fixedCircle,
        );
  }
}