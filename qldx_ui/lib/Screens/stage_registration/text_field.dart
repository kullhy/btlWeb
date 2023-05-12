import 'package:flutter/material.dart';


TextField textField(String text, controller ) {
    return TextField(
      controller: controller,
        decoration: InputDecoration(
          hintText: text,
          filled: true,
          fillColor: Colors.blueGrey[50],
          labelStyle: const TextStyle(fontSize: 12),
          contentPadding: const EdgeInsets.only(left: 30),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: (Colors.blueGrey[50])!),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: (Colors.blueGrey[50])!),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      );
  }
