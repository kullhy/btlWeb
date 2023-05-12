import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:date_field/date_field.dart';
// ignore: depend_on_referenced_packages

import '../../model/racer.dart';
import '../stage_registration/text_field.dart';

TextEditingController nameController = TextEditingController();
DateTimeFormField birthDateController = DateTimeFormField();
TextEditingController telController = TextEditingController();
TextEditingController emailController = TextEditingController();
String? selectedTeam;
String? selectedCountry;
DateTime? _selectedDate;

// Future<void> addRacer(Racer racer) async {
//   final url = Uri.parse('https://example.com/racers');
//   final response = await http.post(
//     url,
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(racer.toJson()),
//   );
//   if (response.statusCode == 201) {
//     print('Racer added successfully');
//   } else {
//     throw Exception('Failed to add racer');
//   }
// }

class FormEdit extends StatefulWidget {
  const FormEdit({super.key, required this.racer});
  final Racer racer;

  @override
  State<FormEdit> createState() => _FormEditState();
}

class _FormEditState extends State<FormEdit> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String? selectedTeam;
    return SingleChildScrollView(
      // scrollDirection: Axis.horizontal,
      child: Container(
        height: size.height - 30,
        width: size.width * 3 / 5,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            const Text(
              "Chỉnh sửa thông tin",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            textField("${widget.racer.name}", nameController),
            const SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blueGrey[50]),
              child: DateTimeFormField(
                validator: (e) =>
                    (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
                // Sử dụng onDateSelected để lấy dữ liệu từ DateTimeFormField và gán cho biến _selectedDate
                onDateSelected: (DateTime value) {
                  setState(() {
                    _selectedDate = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: widget.racer.date,
                  prefixIcon: const Icon(Icons.calendar_today),
                ),
                firstDate: DateTime(1950),
                lastDate: DateTime.now(),
                dateFormat: DateFormat('dd/MM/yyyy'),
                mode: DateTimeFieldPickerMode.date,
              ),
            ),
            const SizedBox(height: 30),
            textField("${widget.racer.tel}", telController),
            const SizedBox(height: 30),
            textField("${widget.racer.email}", emailController),
            const SizedBox(height: 30),
            SizedBox(
              height: 55,
              child: DropdownButtonFormField<String>(
                padding: const EdgeInsets.only(top: 0, bottom: 0),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blueGrey[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                value: selectedTeam, // giá trị của tùy chọn được chọn
                hint: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "${widget.racer.team}",
                    style: const TextStyle(fontSize: 14),
                  ),
                ), // văn bản hiển thị khi không có tùy chọn nào được chọn

                items: <String>[
                  'Đội đua 1',
                  'Đội đua 2',
                  'Đội đua 3',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedTeam =
                        newValue; // cập nhật giá trị của tùy chọn được chọn
                  });
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.all(0),
              child: CSCPicker(
                dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                showCities: false,
                showStates: false,
                layout: Layout.horizontal,
                onCountryChanged: (country) {},
                onStateChanged: (state) {},
                onCityChanged: (city) {},
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: (Colors.deepPurple[100])!,
                    spreadRadius: 10,
                    blurRadius: 20,
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    Racer racer = Racer(
                      name: nameController.text,
                      tel: telController.text,
                      // date: _selectedDate,
                    );
                    // print(selectedTeam);
                  });
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Center(child: Text("XÁC NHẬN"))),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
