import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../_lib.dart';

Text text(
  text, {
  FontWeight? fontWeight,
  double? size,
  Color? color,
  TextAlign? textAlign,
  int? maxLines,
}) {
  return Text(
    '$text',
    maxLines: maxLines,
    textAlign: textAlign,
    softWrap: true,
    overflow: maxLines != null ? TextOverflow.ellipsis : null,
    style: GoogleFonts.ptSans(
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: size ?? 12,
      color: color ?? AppColors.white,
    ),
  );
}
