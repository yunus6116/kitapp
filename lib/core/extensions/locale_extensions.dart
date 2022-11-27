import 'package:flutter/material.dart';

extension LocaleExtensions on Locale{
  String get toBaseUrl => "https://dev.panel.msftogrow.radity.app/${languageCode.toLowerCase()}/api";
}