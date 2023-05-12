import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/racer_on_stage.dart';

class RacerScreen extends StatefulWidget {
  @override
  _RacerScreenState createState() => _RacerScreenState();
}

class _RacerScreenState extends State<RacerScreen> {
  List<RacerOnStage> racers = [];

  Future<List<RacerOnStage>> _fetchRacers() async {
    try {
      final response =
          await http.get(Uri.parse('https://demo0599613.mockable.io/'));
      final jsonData =
          json.decode(response.body)['racersOnStage'] as List<dynamic>;
      final racers = <RacerOnStage>[];
      for (final item in jsonData) {
        racers.add(RacerOnStage.fromJson(item));
      }
      return racers;
    } catch (e) {
      print('Error fetching racers: $e');
      rethrow;
    }
  }

  void _submit() {
    final updatedRacers = racers.map((racer) {
      return RacerOnStage(
        id: racer.id,
        name: racer.name,
        time: racer.time,
        team: racer.team,
      );
    }).toList();
    setState(() {
      racers = updatedRacers;
    });
    final jsonRacers = {
      'racersOnStage': updatedRacers.map((racer) => racer.toJson()).toList()
    };
    final jsonString = json.encode(jsonRacers);
    // gửi jsonString đến API hoặc lưu trữ vào một file
    print(jsonString);
  }

  @override
  void initState() {
    super.initState();
    _fetchRacers().then((fetchedRacers) {
      setState(() {
        racers = fetchedRacers;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách tay đua '),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: racers.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  title: Text(racers[index].name!),
                  subtitle: Text(racers[index].team!),
                  trailing: SizedBox(
                    width: 100,
                    child: TextFormField(
                      initialValue: racers[index].time.toString(),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          racers[index].time = int.tryParse(value) ?? 0;
                        });
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submit,
        child: const Icon(Icons.check),
      ),
    );
  }
}
