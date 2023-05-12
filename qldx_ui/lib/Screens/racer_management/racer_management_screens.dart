import 'package:flutter/material.dart';
import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:qldx_ui/Screens/racer_management/form_edit.dart';

import '../../model/racer.dart';

Future<List<Racer>> fetchRacers() async {
  final response =
      await http.get(Uri.parse('https://demo0005227.mockable.io/'));
  if (response.statusCode == 200) {
    final jsonList = jsonDecode(response.body) as List<dynamic>;
    return jsonList.map((json) => Racer.fromJson(json)).toList();
  } else {
    throw Exception('Failed to fetch racers');
  }
}

Future<void> updateRacers(List<Racer> racers) async {
  final url = Uri.parse('https://demo0005227.mockable.io/');
  final response = await http.post(
    url,
    body: jsonEncode(racers),
    headers: {'Content-Type': 'application/json'},
  );
  if (response.statusCode != 200) {
    throw Exception('Failed to update racers');
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isEditRacer = false;
  late Future<List<Racer>> _futureRacers;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  late Racer editRacer;

  @override
  void initState() {
    super.initState();
    _futureRacers = fetchRacers();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search racers...',
          ),
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
        ),
      ),
      body: Row(
        children: [
          SizedBox(
            width: size.width * 1 / 3,
            child: FutureBuilder<List<Racer>>(
              future: _futureRacers,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final racers = snapshot.data!
                      .where((racer) => racer.name!
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase()))
                      .toList();
                  return Container(
                    margin: const EdgeInsets.only(
                        left: 60, top: 0, right: 30, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: ListView.builder(
                      itemCount: racers.length,
                      itemBuilder: (context, index) {
                        final racer = racers[index];
                        return ListTile(
                          isThreeLine: false,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(racer.name!),
                                  // Text(racer.team!),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          content: const Text(
                                              "Ban xác nhận xoá tay đua này ?"),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Đóng'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                final racers = snapshot.data!;
                                                racers.removeWhere((r) =>
                                                    r.name == racer.name);
                                                updateRacers(
                                                    racers); // Gửi yêu cầu cập nhật dữ liệu đến URL
                                                setState(() {
                                                  _futureRacers =
                                                      Future.value(racers);
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Xác nhận'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.close),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isEditRacer = true;
                                        editRacer = racer;
                                      });
                                    },
                                    icon: const Icon(Icons.edit),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          isEditRacer
              ? FormEdit(
                  racer: editRacer,
                )
              : Container()
        ],
      ),
    );
  }
}
