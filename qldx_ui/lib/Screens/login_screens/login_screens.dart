import 'package:flutter/material.dart';
import 'package:qldx_ui/Screens/login_screens/login_form.dart';

import '../detail/menu.dart';

// import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
          Body()
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
                'Đăng nhập để vào \nHệ thống lịch thi đấu giải đua moto',
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

              // Image.asset(
              //   'images/f1_login.png',
              //   width: 300,
              // ),
            ],
          ),
        ),

        Image.asset(
          'images/f1_login.png',
          width: 300,
        ),
        // MediaQuery.of(context).size.width >= 1300 //Responsive
        //     ? Image.asset(
        //         'images/illustration-1.png',
        //         width: 300,
        //       )
        //     : SizedBox(),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 10),
          child: const SizedBox(
            width: 320,
            child: LoginForm(),
          ),
        )
      ],
    );
  }
}
