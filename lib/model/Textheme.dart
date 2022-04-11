// ignore: file_names
import 'package:flutter/material.dart';

class ThemeHelper {
  InputDecoration textInputDecoration(
      {String? lableText = "",
      String? hintText = "",
      bool? phone = false,
      Icon? suffixIcon}) {
    return InputDecoration(
      labelText: lableText,
      hintText: hintText,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFC2A26A), width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFC2A26A), width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      border: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFC2A26A), width: 3.0),
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      prefixText: phone == true ? "+964 " : null,
      suffixIcon: suffixIcon,
      labelStyle: const TextStyle(fontSize: 13, color: Colors.grey),
      hintStyle: const TextStyle(fontSize: 13),
    );
  }
}
