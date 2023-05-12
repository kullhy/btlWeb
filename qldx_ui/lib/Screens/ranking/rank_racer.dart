import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../model/rank_racer.dart';

Future<List<RankRacer>> _fetchRankRacers() async {
  try {
    final response =
        await http.get(Uri.parse('https://demo0599613.mockable.io/'));
    final jsonData =
        json.decode(response.body)['racersOnStage'] as List<dynamic>;
    final racers = <RankRacer>[];
    for (final item in jsonData) {
      racers.add(RankRacer.fromJson(item));
    }
    return racers;
  } catch (e) {
    print('Error fetching racers: $e');
    rethrow;
  }
}

class RankRacerWidget extends StatefulWidget {
  const RankRacerWidget(
      {super.key, required this.idStage, required this.nameStage});

  final int idStage;
  final String nameStage;

  @override
  State<RankRacerWidget> createState() => _RankRacerWidget();
}

class _RankRacerWidget extends State<RankRacerWidget> {
  List<RankRacer> racers = [];

  @override
  void initState() {
    super.initState();
    _fetchRankRacers().then((fetchedRacers) {
      setState(() {
        racers = fetchedRacers;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 1000,
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          widget.idStage != 0
              ? Text("BXH chặng ${widget.nameStage}",style: const TextStyle(fontSize: 20),)
              : const SizedBox(),
          Container(
            width: 760,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Xếp hạng",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Tên",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Đội",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "Điểm",
                    style: TextStyle(fontSize: 16),
                  )
                ]),
          ),
          SizedBox(
            width: 800,
            height: 550,
            child: ListView.builder(
              itemCount: racers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                        title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(index.toString()),
                        Text(racers[index].name!),
                        Text(racers[index].team!),
                        Text(racers[index].point!.toString()),
                      ],
                    )),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
