import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.vmax),
      child: Column(
        children: [
          SizedBox(
            width: 100.w,
            child: Text(
                    "Imagem de perfil",
                      style: GoogleFonts.getFont(
                      'Open Sans',
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 1.7.vmax,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      textAlign: TextAlign.start,
                ),
          ),
          Container(
            width: 80, // Largura do círculo
            height: 80, // Altura do círculo
            decoration: const BoxDecoration(
              shape: BoxShape.circle, // Define a forma como um círculo
              color: Colors.grey, // Cor de preenchimento do círculo
            ),
            // Conteúdo dentro do círculo (opcional)
            child: Center(
              child: Icon(Icons.camera_alt_sharp, color: Colors.white, size: 3.5.vmax,),
            ),
          )
    
        ],
      ),
    );
  }
}