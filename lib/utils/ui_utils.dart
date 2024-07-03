import 'dart:ui';

import 'package:flutter/material.dart';

import 'material_color.dart';

MaterialColor primaryColor = generateMaterialColor(const Color(0xFF5569ff));
MaterialColor secondaryColor = generateMaterialColor(const Color(0xFF250594));

SizedBox vSpaceSmall = const SizedBox(
  height: 5,
);
SizedBox vSpace = const SizedBox(
  height: 10,
);
SizedBox vSpaceBig = const SizedBox(
  height: 20,
);
SizedBox hSpace = const SizedBox(
  width: 10,
);
SizedBox hSpaceSmall = const SizedBox(
  width: 5,
);
SizedBox hSpaceBig = const SizedBox(
  width: 20,
);

Color primary = Colors.deepPurple;
Color secondary = const Color(0xFF5569ff);
BorderRadius inputRadius = BorderRadius.circular(10.0);
Widget divider = Divider(
  thickness: 1.0,
  indent: 0,
  endIndent: 0,
  height: 0.1,
  color: Colors.grey.shade200,
);

double textHeightAr = 1.3;
double textHeightEn = 1.2;

TextStyle get heading => TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,);
TextStyle get headingMedium => TextStyle(
    fontSize: 14,);
TextStyle get headingSmall => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,);
TextStyle get headingBold => TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,);
TextStyle get heading2 => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,);
TextStyle get heading3 => TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w800,);
TextStyle smallText = TextStyle(
    fontSize: 9,);
TextStyle smallText2 = TextStyle(
    fontSize: 11,);
TextStyle smallText3 = TextStyle(
    fontSize: 12,);
TextStyle smallText4 = TextStyle(
    fontSize: 13,);

TextStyle normalText = TextStyle(
    fontSize: 14,);
TextStyle headingText = TextStyle(
    fontSize: 14.5,
    fontWeight: FontWeight.w600,);

TextStyle bigText = const TextStyle(fontSize: 18, fontWeight: FontWeight.w400);
TextStyle defaultStyle = const TextStyle(color: Colors.grey, fontSize: 14.0);
TextStyle linkStyle = const TextStyle(color: Colors.deepPurple);
SizedBox verticalSpace = const SizedBox(height: 10);
SizedBox verticalSpaceSmall = const SizedBox(height: 5);
SizedBox verticalSpaceBig = const SizedBox(height: 20);
SizedBox horizontalSpace = const SizedBox(width: 10);

//button style
EdgeInsets buttonPadding =
const EdgeInsets.symmetric(horizontal: 20, vertical: 12);
RoundedRectangleBorder get buttonShape {
  return const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(6.0)));
}

TextStyle buttonText = const TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 17.0,
);

ButtonStyle get buttonStyle {
  return ElevatedButton.styleFrom(
      elevation: 6,
      shape: buttonShape,
      backgroundColor: primaryColor,
      padding: buttonPadding,
      textStyle: buttonText);
}

Color greyAndPurple(BuildContext context) {
  ThemeData theme = Theme.of(context);
  return theme.brightness.index == 1
      ? theme.colorScheme.primary
      : Colors.grey.shade800;
}

InputDecoration inputDecoration(
    {String? hintText,
      Widget? suffixIcon,
      Widget? prefixIcon,
      String? label,
      double? radius,
      Color? fillColor,
      Widget? prefix,
      Widget? suffix,
      BorderSide? borderSide}) {
  return InputDecoration(
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    prefix: prefix,
    suffix: suffix,
    label: label != null ? Text(label) : null,
    labelStyle: borderSide != null ? const TextStyle(color: Colors.grey) : null,
    hintText: hintText ?? "",
    hintStyle: const TextStyle(color: Colors.grey),
    filled: true,
    fillColor: fillColor ?? Colors.grey.withOpacity(0.1),
    errorStyle: borderSide != null
        ? const TextStyle(color: Colors.deepOrangeAccent)
        : null,
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: borderSide != null ? Colors.deepOrangeAccent : primaryColor),
      borderRadius:
      radius != null ? BorderRadius.circular(radius) : inputRadius,
    ),
    border: OutlineInputBorder(
      borderSide:
      borderSide ?? const BorderSide(color: Colors.transparent, width: 1),
      borderRadius:
      radius != null ? BorderRadius.circular(radius) : inputRadius,
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
      borderRadius:
      radius != null ? BorderRadius.circular(radius) : inputRadius,
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: borderSide ?? const BorderSide(color: Colors.transparent),
      borderRadius:
      radius != null ? BorderRadius.circular(radius) : inputRadius,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: borderSide != null ? primaryColor.shade50 : primaryColor),
      borderRadius:
      radius != null ? BorderRadius.circular(radius) : inputRadius,
    ),
    contentPadding: const EdgeInsets.all(15.0),
  );
}

Route goToPage(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}

/// Image Blur
ImageFilter get imageBlur => ImageFilter.blur(sigmaX: 10, sigmaY: 10);

//Card
RoundedRectangleBorder cardShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)));
// stringToTime(String time){
//   return DateFormat.jm().format(DateFormat("hh:mm:ss").parse(time));
// }
