import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:qldx_ui/Screens/games_screens/form_create_game.dart';

import '../../model/games.dart';
import 'package:flutter/material.dart';

class ScheduleService {
  final String apiUrl = 'https://demo0005227.mockable.io/';

  Future<List<Schedule>> getSchedule() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body)['data'];
      return jsonList.map((e) => Schedule.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load schedule');
    }
  }
}

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  late Future<List<Schedule>> _scheduleFuture;

  @override
  void initState() {
    super.initState();
    _scheduleFuture = ScheduleService().getSchedule();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lịch thi đấu'),
        ),
        body: FutureBuilder<List<Schedule>>(
          future: _scheduleFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final scheduleList = snapshot.data!;
              return Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  // height: 1000,
                  padding: EdgeInsets.all(20),
                  width: 800,
                  child: ListView.builder(
                    itemCount: scheduleList.length,
                    itemBuilder: (context, index) {
                      final schedule = scheduleList[index];
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('${schedule.id}'),
                            Text('${schedule.gameDay}'),
                            Text('${schedule.gameDayTime}'),
                            Text('${schedule.gameDayAdds}'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
             
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormCreateGame()),
              );
            });
          },
          child: const Icon(Icons.add_circle_outline),
        ));
  }
}
