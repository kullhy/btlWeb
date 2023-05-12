import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:date_field/date_field.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:qldx_ui/Screens/stage_registration/text_field.dart';

import '../../model/racer.dart';

TextEditingController nameController = TextEditingController();
// TextEditingController nameController = TextEditingController();
// TextEditingController nameController = TextEditingController();
// TextEditingController nameController = TextEditingController();
// TextEditingController nameController = TextEditingController();
// TextEditingController nameController = TextEditingController();


Future<void> addRacer(Racer racer) async {
  final url = Uri.parse('https://example.com/racers');
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(racer.toJson()),
  );
  if (response.statusCode == 201) {
    print('Racer added successfully');
  } else {
    throw Exception('Failed to add racer');
  }
}

class FormRegis extends StatefulWidget {
  const FormRegis({super.key});

  @override
  State<FormRegis> createState() => _FormRegisState();
}

class _FormRegisState extends State<FormRegis> {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        textField("Tên giải đấu",nameController),
        textField("Tên giải đấu",nameController),
        textField("Tên giải đấu",nameController),
        textField("Tên giải đấu",nameController),
        textField("Tên giải đấu",nameController),
        textField("Tên giải đấu",nameController),
        textField("Tên giải đấu",nameController),
        textField("Tên giải đấu",nameController),
        textField("Tên giải đấu",nameController),
        textField("Tên giải đấu",nameController),
      ]),
    );
  }
}
