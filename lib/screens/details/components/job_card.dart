import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class JobCards extends StatelessWidget {
  final String title;
  final String adm;
  const JobCards({super.key,required this.title,required this.adm});

  // static const IconData verified = IconData(0xe699, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Container(
                        width: 100.w,
                        height: 12.h,
                        padding: EdgeInsets.symmetric(horizontal: 1.vmax),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 8.w, // Largura do círculo
                                height: 8.h, // Altura do círculo
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle, // Define a forma como um círculo
                                  color: Colors.grey, // Cor de preenchimento do círculo
                                ),
                                // Conteúdo dentro do círculo (opcional)
                                child: Center(
                                  child: Icon(Icons.camera_alt_sharp, color: Colors.white, size: 2.5.vmax,),
                                ),
                              ),
                            Container(
                              width: 77.w,
                              padding: EdgeInsets.all(1.5.vmax),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 1.vmax),
                                    child: Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          title,
                                          style: GoogleFonts.getFont(
                                              'Open Sans',
                                              textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 1.7.vmax,
                                                fontWeight: FontWeight.w700,
                                              ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 1.vmax),
                                          child: Icon(Icons.verified, color: const Color(0xFF7A5CF0), size: 1.3.vmax,),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          "Administrador",
                                          style: GoogleFonts.getFont(
                                              'Open Sans',
                                              textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 1.3.vmax,
                                                fontWeight: FontWeight.w700,
                                              ),
                                          ),
                                        ),
                                      Container(
                                        width: 32.w,
                                        padding: EdgeInsets.all(1.vmax),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey, // Cor da borda (preta neste caso)
                                            width: 1, // Largura da borda em pixels
                                          ),
                                        ),
                                        child: Text(
                                            adm,
                                            style: GoogleFonts.getFont(
                                                'Open Sans',
                                                textStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 1.3.vmax,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                            ),
                                          ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
  }
}