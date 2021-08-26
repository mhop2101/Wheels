import 'package:flutter/material.dart';

TextStyle loginUniandesStyle = TextStyle(
  color: Colors.white,
  fontSize: 45,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.lerp(
    FontWeight.w700,
    FontWeight.w500,
    1.1,
  ),
);

TextStyle lowerLoginCaption = TextStyle(
  color: Colors.white70,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

ButtonStyle loginButtonStyle = ButtonStyle(
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(5)),
  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
    ),
  ),
);
