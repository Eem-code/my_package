library resto_page;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class Adaptive {
  /// check platform
  static bool _isIos() => (!Platform.isIOS);

  ///Material design Adaptive
  static Widget scaffold({required String title, required Widget body}) {
    return (_isIos())
        ? _iosScaffold(title, body)
        : _androidScaffold(title, body);
  }

  static text(
      {required String string, Color? color, double? size, TextAlign? align}) {
    TextStyle style = _textStyle(color: color, size: size);
    return (_isIos())
        ? _iOSText(string: string, style: style, align: align)
        : _androidText(string: string, style: style, align: align);
  }

  /// Android material
  /// A ne pas intégrer directement
  /// Le android Scaffold
  static Scaffold _androidScaffold(String title, Widget body) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
    );
  }

  ///Android text
  static Text _androidText(
      {required String string, required TextStyle style, TextAlign? align}) {
    return Text(
      string,
      textAlign: align ?? TextAlign.left,
      style: style,
    );
  }

  static _androidErrorAlert({required BuildContext context}) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Column(
              children: [
                text(string: 'Une erreur est apparu'),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: text(string: 'ok'))
              ],
            ),
          );
        });
  }

  /// Ios material
  /// A ne pas intégrer directement
  /// Le ios Scaffold
  static CupertinoPageScaffold _iosScaffold(String title, Widget body,
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

  /// Le ios text
  static DefaultTextStyle _iOSText(
      {required String string, required TextStyle style, TextAlign? align}) {
    return DefaultTextStyle(
      style: style,
      child: Text(
        string,
        textAlign: TextAlign.left,
      ),
    );
  }

  /// Le ios alerte
  static _iOSErrorAlert({required BuildContext context}) {
    return CupertinoAlertDialog(
      content: Column(
        children: [text(string: 'Erreur')],
      ),
      actions: [
        CupertinoButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: text(string: 'ok'))
      ],
    );
  }

  /// Adaptive alerte
  static alert({required BuildContext context}) {
    return (_isIos())
        ? _iOSErrorAlert(context: context)
        : _androidErrorAlert(context: context);
  }

  ///Both material

  static TextStyle _textStyle({Color? color, double? size, TextAlign? align}) {
    return TextStyle(color: color ?? Colors.black, fontSize: size ?? 20.0);
  }
}
