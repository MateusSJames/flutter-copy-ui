import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final double fontSize;
  final double margin;
  final double width;
  final double height;
  final double borderRadius;
  final double borderWidth;
  final bool loading;
  final bool disabled;

  const Button({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.height,
    required this.width,
    required this.fontSize,
    this.margin = 3,
    this.borderRadius = 2,
    this.borderWidth = 0.1,
    this.loading = false,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      activeOpacity: 0.4,
      child: OutlinedButton(
        onPressed: disabled == true ? null : onPressed,
        child: loading
            ? Container(
                height: 5.vmax,
                width: 5.vmax,
                padding: EdgeInsets.zero,
                child: CircularProgressIndicator(
                  color: const Color(0x4E97FE),
                  strokeWidth: 0.15.vmax,
                ),
              )
            : Text(
                title,
                style: GoogleFonts.getFont(
                  'Montserrat',
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: fontSize.vmax,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(borderRadius.vmax)),
          ),
          side: BorderSide(
            color: const Color(0xFF4E97FE),
            width: borderWidth.vmax,
          ),
        ),
      ),
    );
  }
}