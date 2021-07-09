import 'package:flutter/material.dart';

class Snackbar {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      new GlobalKey<ScaffoldState>();

  static void showInSnackBar(String value) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }
}
