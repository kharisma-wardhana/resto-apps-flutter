import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const mainColor = Color(0xFFFFC046);
const mainColorDark = Color(0xFFFF8F00);
const secondColor = Color(0xFF62727B);
const secondColorDark = Color(0xFF37474F);
const whiteColor = Color(0xFFFAFAFA);
const lightColor = Color(0xFFE2F1F8);

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
