import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const mainColor = Color(0xFFFAD744);
const mainColorDark = Color(0xFFEF5455);
const secondColor = Color(0xFF2B3252);
const secondColorDark = Color(0xFF141A46);
const whiteColor = Color(0xFFFAFAFA);
const lightColor = Color(0xFFFBEAEB);

const double defaultMargin = 24;

TextStyle titleStyle = GoogleFonts.openSans().copyWith(
  color: mainColor,
  fontSize: 20,
  fontWeight: FontWeight.w700,
);
TextStyle subtitleStyle = GoogleFonts.poppins().copyWith(
  color: mainColorDark,
  fontSize: 16,
  fontWeight: FontWeight.w600,
);
TextStyle infoLightStyle = GoogleFonts.poppins().copyWith(
  color: lightColor,
);
TextStyle infoStyle = GoogleFonts.poppins().copyWith(
  color: secondColor,
);
