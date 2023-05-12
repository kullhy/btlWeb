import 'package:flutter/material.dart';

import 'package:qldx_ui/Screens/ranking/rank_screens.dart';
import 'package:qldx_ui/Screens/result_screens/result_screens.dart';

import '../games_screens/game_screens.dart';
import '../racer_management/racer_management_screens.dart';
// import '../stage_registration/racer_registration_screens.dart';

class FuntionFrm extends StatefulWidget {
  const FuntionFrm({super.key});

  @override
  State<FuntionFrm> createState() => _FuntionFrm();
}

class _FuntionFrm extends State<FuntionFrm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          const Text(
            "CHỌN ĐỂ TIẾP TỤC",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 50),
          buttonFuntion("Bảng xếp hạng", const RankRacerScreen()),
          // const SizedBox(
          //   height: 40,
          // ),
          // buttonFuntion("Đăng ký thi đấu", const RacerRegistration()),
          const SizedBox(
            height: 40,
          ),
          buttonFuntion("Xem lịch thi đấu", ScheduleScreen()),
          const SizedBox(
            height: 40,
          ),
          buttonFuntion("Cập nhật kết quả", const RaceStageScreen()),
          const SizedBox(
            height: 40,
          ),
          buttonFuntion("Quản lý", const SearchPage()),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget buttonFuntion(String buttonHint, Widget screens) {
    return Container(
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
        // ignore: avoid_print
        onPressed: () {
          setState(
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => screens),
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 65, 141, 128),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: SizedBox(
            width: double.infinity,
            height: 50,
            child: Center(child: Text(buttonHint))),
      ),
    );
  }
}
