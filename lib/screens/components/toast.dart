import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ToastEmitter {
  final TextStyle titleStyles = GoogleFonts.getFont(
    'Montserrat',
    textStyle: TextStyle(
      color: Colors.black54,
      fontSize: 1.6.vmax,
      fontWeight: FontWeight.w700,
    ),
  );

  final TextStyle descriptionStyles = GoogleFonts.getFont(
    'Montserrat',
    textStyle: TextStyle(
      color: Colors.black45,
      fontSize: 1.4.vmax,
      fontWeight: FontWeight.w500,
    ),
  );

  warn({
    String? text,
    description,
    context,
    double width = 90,
    double height = 10,
    int duration = 3,
    Function? onClose,
  }) async {
    return MotionToast.warning(
      title: text != null ? Text(text, style: titleStyles) : null,
      description: Text(description, style: descriptionStyles),
      width: width.w,
      height: height.h,
      animationType: AnimationType.fromTop,
      position: MotionToastPosition.top,
      dismissable: false,
      toastDuration: Duration(seconds: duration),
      displaySideBar: false,
      iconSize: 5.vmax,
      onClose: onClose,
    ).show(context);
  }

  success({
    String? text,
    description,
    context,
    double width = 90,
    double height = 10,
    int duration = 3,
    Function? onClose,
  }) async {
    return MotionToast.success(
      title: text != null ? Text(text, style: titleStyles) : null,
      description: Text(description, style: descriptionStyles),
      width: width.w,
      height: height.h,
      animationType: AnimationType.fromTop,
      position: MotionToastPosition.top,
      dismissable: false,
      toastDuration: Duration(seconds: duration),
      displaySideBar: false,
      iconSize: 5.vmax,
      onClose: onClose,
    ).show(context);
  }

  error({
    String? text,
    description,
    context,
    double width = 90,
    double height = 10,
    int duration = 3,
    Function? onClose,
  }) async {
    return MotionToast.error(
      title: text != null ? Text(text, style: titleStyles) : null,
      description: Text(description, style: descriptionStyles),
      width: width.w,
      height: height.h,
      animationType: AnimationType.fromTop,
      position: MotionToastPosition.top,
      dismissable: false,
      toastDuration: Duration(seconds: duration),
      displaySideBar: false,
      iconSize: 5.vmax,
      onClose: onClose,
    ).show(context);
  }

  info({
    String? text,
    description,
    context,
    double width = 90,
    double height = 10,
    int duration = 3,
    Function? onClose,
  }) async {
    return MotionToast.info(
      title: text != null ? Text(text, style: titleStyles) : null,
      description: Text(description, style: descriptionStyles),
      width: width.w,
      height: height.h,
      animationType: AnimationType.fromTop,
      position: MotionToastPosition.top,
      dismissable: false,
      toastDuration: Duration(seconds: duration),
      displaySideBar: false,
      iconSize: 5.vmax,
      onClose: onClose,
    ).show(context);
  }
}
