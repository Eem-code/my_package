library resto_page;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class Adaptive {
  //check platform
  static bool isIos() => (Platform.isIOS);

  //Material design Adaptive
  static Widget scaffold({required String title, required Widget body}) {
    return (isIos()) ? iosScaffold(title, body) : androidScaffold(title, body);
  }

  static text(
      {required String string, Color? color, double? size, TextAlign? align}) {
    TextStyle style = textStyle(color: color, size: size);
    return (isIos())
        ? iOSText(string: string, style: style, align: align)
        : androidText(string: string, style: style, align: align);
  }

// Android material
  static Scaffold androidScaffold(String title, Widget body) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
    );
  }

  static Text androidText(
      {required String string, required TextStyle style, TextAlign? align}) {
    return Text(
      string,
      textAlign: align ?? TextAlign.left,
      style: style,
    );
  }
//s Ios material

  static CupertinoPageScaffold iosScaffold(String title, Widget body,
      {TextAlign? align}) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            title,
            textAlign: align ?? TextAlign.left,
          ),
        ),
        child: body);
  }

  static DefaultTextStyle iOSText(
      {required String string, required TextStyle style, TextAlign? align}) {
    return DefaultTextStyle(
      style: style,
      child: Text(
        string,
        textAlign: TextAlign.left,
      ),
    );
  }

//Both material

  static TextStyle textStyle({Color? color, double? size, TextAlign? align}) {
    return TextStyle(color: color ?? Colors.black, fontSize: size ?? 20.0);
  }
}
