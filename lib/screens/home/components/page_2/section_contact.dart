import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SectionContact extends StatelessWidget {
  final String wpp;
  final String mail;
  const SectionContact({super.key, required this.wpp, required this.mail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.4.vmax),
          child: Text(
            "Contato",
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
              Icons.phone,
              color: Color(0xFF7A5CF0),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 1.vmax),
              child: Text(
              wpp,
                style: GoogleFonts.getFont(
                  'Open Sans',
                  textStyle: TextStyle(
                  color: const Color(0xFF909094),
                  fontSize: 1.5.vmax,
                  fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0.5.vmax),
          child: Row(
            children: [
              const Icon(
                Icons.mail_outline_sharp,
                color: Color(0xFF7A5CF0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 1.vmax),
                child: Text(
                mail,
                  style: GoogleFonts.getFont(
                    'Open Sans',
                    textStyle: TextStyle(
                    color: const Color(0xFF909094),
                    fontSize: 1.5.vmax,
                    fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}