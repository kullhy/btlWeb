import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qldx_ui/Screens/racer_stage_member/racer_stage_member.dart';
import 'package:qldx_ui/Screens/ranking/rank_racer.dart';
import 'package:qldx_ui/model/rank_racer.dart';

import '../../model/race_stage.dart';
import 'package:http/http.dart' as http;

Future<List<RaceStage>> fetchRaceStages() async {
  final response =
      await http.get(Uri.parse('https://demo0005227.mockable.io/'));

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => RaceStage.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load race stages');
  }
}

class RankRacerScreen extends StatefulWidget {
  const RankRacerScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RankRacerScreenState createState() => _RankRacerScreenState();
}

class _RankRacerScreenState extends State<RankRacerScreen> {
  late Future<List<RaceStage>> _raceStages;

  @override
  void initState() {
    super.initState();
    _raceStages = fetchRaceStages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Race Stages')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 300,
            height: 500,
            margin: const EdgeInsets.only(left: 20),
            child: FutureBuilder<List<RaceStage>>(
              future: _raceStages,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 2,
                      // mainAxisExtent: 20,
                      crossAxisSpacing: 20,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final raceStage = snapshot.data![index];
                      return InkWell(
                        child: Card(
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(raceStage.name),
                                const SizedBox(height: 8),
                                Text('Racer member: ${raceStage.racermember}'),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RankRacerWidget(idStage: raceStage.id, nameStage: raceStage.name,)),
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return const CircularProgressIndicator();
              },
            ),
          ),
          RankRacerWidget(idStage: 0, nameStage: ""),
          Image.asset(
            "images/cup.png",
            height: 200,
            width: 100,
          )
        ],
      ),
    );
  }
}
