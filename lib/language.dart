import 'package:flutter/material.dart';

class Language {
  String name;
  String description;
  Icon icon = Icon(Icons.android);
  bool selected = false;

  Language(this.name, this.description, this.icon);
}
