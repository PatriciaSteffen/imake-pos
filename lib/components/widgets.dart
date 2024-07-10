import 'package:flutter/material.dart';

Text buildText(String text, Color color, double fontSize, FontWeight fontWeight,
    TextAlign textAlign, TextOverflow overflow) {
  return Text(
    text,
    textAlign: textAlign,
    overflow: overflow,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    ),
  );
}

RichText buildRichText(
    String title, String text, Color color, double fontSize, TextOverflow overflow) {
  return RichText(
    overflow: overflow,
    text: TextSpan(
      text: '$title: ',
      style: TextStyle(
          fontWeight: FontWeight.bold, color: color, fontSize: fontSize),
      children: <TextSpan>[
        TextSpan(
            text: text, style: const TextStyle(fontWeight: FontWeight.normal)),
      ],
    ),
  );
}
