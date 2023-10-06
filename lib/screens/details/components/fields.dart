import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailsField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const DetailsField({
    super.key,
    required this.label,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.vmax),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.4.vmax),
            child: Text(
                  label,
                  style: GoogleFonts.getFont(
                  'Open Sans',
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 1.7.vmax,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
            ),
          ),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              isDense: true
            ),
            controller: controller,
            
          ),
        ],
      ),
    );
  }
}