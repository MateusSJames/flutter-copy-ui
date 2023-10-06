import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SectionMap extends StatelessWidget {
  const SectionMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 2.vmax),
          child: Text(
            "Localização",
            style: GoogleFonts.getFont(
              'Open Sans',
              textStyle: TextStyle(
              color: Colors.black,
              fontSize: 1.5.vmax,
              fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: Color(0xFF7A5CF0),
            ),
            Text(
            "São Jorge 2ª Seção, Belo Horizonte - MG, 30451-102",
              style: GoogleFonts.getFont(
                'Open Sans',
                textStyle: TextStyle(
                color: const Color(0xFF909094),
                fontSize: 1.5.vmax,
                fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        Container(
          child: Image.asset("assets/map.png"),
          padding: EdgeInsets.symmetric(horizontal: 2.vmax, vertical: 1.vmax),
        )
      ],
    );
  }
}