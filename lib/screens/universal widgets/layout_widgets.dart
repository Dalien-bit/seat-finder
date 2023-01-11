import 'dart:ui';

import 'package:flutter/material.dart';

AppBar appbar(String text) {
  return AppBar(
    title: Text(
      text,
      style: const TextStyle(color: Colors.blue, fontSize: 25),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
  );
}

