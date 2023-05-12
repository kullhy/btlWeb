import 'package:flutter/material.dart';
import 'package:qldx_ui/Screens/home_screens/funtion_button.dart';

import '../detail/menu.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 186, 186),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 8),
        children: const [
          Menu(),
          // MediaQuery.of(context).size.width >= 980
          //     ? Menu()
          //     : SizedBox(), // Responsive
          SizedBox(
            height: 40,
          ),
          Body(),
        ],
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          width: 360,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hệ thống lịch thi đấu giải đua moto\nLựa chọn chức năng để tiếp tục',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Hệ thống thuộc quyền quản lý của nhóm 1",
                style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Image.asset(
          'images/f1_login.png',
          width: 300,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 10),
          child: const SizedBox(
            width: 320,
            child: FuntionFrm(),
          ),
        )
      ],
    );
  }
}
