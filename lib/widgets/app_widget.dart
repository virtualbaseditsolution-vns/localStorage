import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/ui_utils.dart';


class TopNavBar extends StatelessWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;

  const TopNavBar({super.key, this.title, this.actions, this.leading});

  @override
  Widget build(BuildContext context) {
    // var lng = Get.locale!.languageCode;
    return AppBar(
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      leading: const BackButton(),
      actions: actions,
      title: Text(title??"",style: heading.copyWith(color: Colors.black),),
      centerTitle: true,
    );
  }
}
class TopBar extends StatelessWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;

  const TopBar({super.key, this.title, this.actions, this.leading});

  @override
  Widget build(BuildContext context) {
    // var lng = Get.locale!.languageCode;
    return AppBar(
      elevation: 0,
      leading: leading,
      iconTheme: const IconThemeData(color: Colors.black),
      backgroundColor: Colors.transparent,
      actions: actions,
      title: Text(title??"",style: headingBold.copyWith(color: Colors.black,fontSize: 20),),
    );
  }
}




class AppLoader extends StatelessWidget {
  final double? width;
  final Color? color;
  const AppLoader({super.key, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid?CircularProgressIndicator(color: color,strokeWidth: 3,):CupertinoActivityIndicator(color: color,);
  }
}

/// Buttons
class SolidButton extends StatelessWidget {
  final bool? loading;
  final Widget child;
  final Function()? onPressed;
  final ButtonStyle? style;
  const SolidButton({Key? key, this.loading=false, required this.child, required this.onPressed, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: loading!?null:onPressed,
      style: style??ElevatedButton.styleFrom(disabledBackgroundColor: primaryColor.shade300),
      child: loading!
          ? const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ))
          : child,
    );
  }
}
class OutlineButton extends StatelessWidget {
  final bool? loading;
  final Widget child;
  final Function() onPressed;
  final ButtonStyle? style;
  const OutlineButton({Key? key, this.loading=false, required this.child, required this.onPressed, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: loading!?null:onPressed,
      style: style,
      child: loading!
          ? const SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ))
          : child,
    );
  }
}


class AppCard extends StatelessWidget {
  final Color? color;
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final bool selected;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? shadow;
  final double? elevation;
  final Border? border;
  const AppCard({super.key, this.color, required this.child, this.margin, this.padding, this.selected=false, this.borderRadius, this.shadow, this.elevation=4.0, this.border});

  @override
  Widget build(BuildContext context) {
    late final ColorScheme colors = Theme.of(context).colorScheme;

    return Container(
      margin: margin?? const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          color: color?? colors.surface,
          borderRadius: borderRadius??BorderRadius.circular(10),
          border: selected ? Border.all(color: primaryColor) : border,
          boxShadow: shadow ?? [
            BoxShadow(
              color: const Color.fromRGBO(0, 0, 0, 0.15),
              offset: const Offset(0, 0),
              blurRadius: elevation!,
            )
          ]),
      child: child,
    );
  }
}

