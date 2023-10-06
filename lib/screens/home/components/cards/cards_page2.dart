import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CardsPage2 extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final String adm;
  const CardsPage2({super.key, required this.description, required this.title, required this.color, required this.adm});

  // static const IconData verified = IconData(0xe699, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Container(
                        width: 100.w,
                        height: 8.h,
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
                                                fontSize: 1.5.vmax,
                                                fontWeight: FontWeight.w700,
                                              ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 1.vmax),
                                          child: Icon(Icons.verified, color: color, size: 1.3.vmax,),
                                        ),
                                        Text(
                                          adm,
                                          style: GoogleFonts.getFont(
                                              'Open Sans',
                                              textStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 1.vmax,
                                                fontWeight: FontWeight.w700,
                                              ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      description,
                                      style: GoogleFonts.getFont(
                                          'Open Sans',
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 1.3.vmax,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      ),
                                      // overflow: TextOverflow.ellipsis,
                                      // softWrap: false,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
  }
}