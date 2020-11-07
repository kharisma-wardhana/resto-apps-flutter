import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

const mainColor = Color(0xFFFEA725); //F88D07
const mainColorDark = Color(0xFFDF8806); //E97204
const secondColor = Color(0xFF505E5E);
const secondColorDark = Color(0xFF394242); //060401
const whiteColor = Color(0xFFD1D3DB);
const lightColor = Color(0xFFB0BAD4);

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

Widget loadingIndicator = SpinKitFadingFour(
  color: mainColor,
);
