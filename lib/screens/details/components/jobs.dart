import 'package:estagio_flutter/screens/components/edit_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class JobsField extends StatelessWidget {
  // final TextEditingController controllermd1;
  // final TextEditingController controllermd2;
  const JobsField({
    super.key,
    // required this.controllermd1,
    // required this.controllermd2
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                      "Edifícios",
                      style: GoogleFonts.getFont(
                      'Open Sans',
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 1.7.vmax,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                ),
                Button(onPressed: (){}, title: "Adicionar", height: 0.4.h, width: 2.w, fontSize: 1.4)
              ],
            ),
          ),
        ],
      ),
    );
  }
}