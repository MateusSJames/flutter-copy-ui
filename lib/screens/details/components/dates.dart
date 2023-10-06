import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final _timeFormatter = MaskTextInputFormatter(
    mask: 'HH:MM',
    filter: {"H": RegExp(r'[0-2]'), "M": RegExp(r'[0-5]')},
  );

class DetailsDates extends StatelessWidget {
  final String day;
  final TextEditingController controllerInitHour;
  final TextEditingController controllerEndHour;
  const DetailsDates({
    super.key,
    required this.day,
    required this.controllerInitHour,
    required this.controllerEndHour,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.vmax),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                                        width: 40.w,
                                        height: 5.h,
                                        padding: EdgeInsets.all(1.vmax),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey, // Cor da borda (preta neste caso)
                                            width: 1, // Largura da borda em pixels
                                          ),
                                        ),
                                        child: Text(
                                            day,
                                            style: GoogleFonts.getFont(
                                                'Open Sans',
                                                textStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 1.7.vmax,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            ),
                                          ),
                                      ),
              SizedBox(
                width: 20.w,
                height: 5.h,
                child: TextField(
                  inputFormatters: [_timeFormatter],
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: controllerInitHour,
                ),
              ),
              Text(
                  "às",
                  style: GoogleFonts.getFont(
                  'Open Sans',
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 1.7.vmax,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
            ),
              SizedBox(
                width: 20.w,
                height: 5.h,
                child: TextField(
                  inputFormatters: [_timeFormatter],
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: controllerEndHour,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DetailsDatesFds extends StatelessWidget {
  final String day;
  final TextEditingController controllerInitHour;
  const DetailsDatesFds({
    super.key,
    required this.day,
    required this.controllerInitHour,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.vmax),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                                        width: 40.w,
                                        height: 5.h,
                                        padding: EdgeInsets.all(1.vmax),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey, // Cor da borda (preta neste caso)
                                            width: 1, // Largura da borda em pixels
                                          ),
                                        ),
                                        child: Text(
                                            day,
                                            style: GoogleFonts.getFont(
                                                'Open Sans',
                                                textStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 1.7.vmax,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            ),
                                          ),
                                      ),
              SizedBox(
                width: 40.w,
                height: 5.h,
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  controller: controllerInitHour,
                  enabled: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}