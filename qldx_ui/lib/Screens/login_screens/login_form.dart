import 'dart:convert';

import 'package:flutter/material.dart';

import '../../model/user.dart';
import '../home_screens/home_screens.dart';
import 'package:http/http.dart' as http;

TextEditingController usernameController = TextEditingController();
TextEditingController passController = TextEditingController();

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isSeenPass = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "ĐĂNG NHẬP",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 50),
        TextField(
          controller: usernameController,
          decoration: InputDecoration(
            hintText: 'Tên tài khoản',
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: (Colors.blueGrey[50])!),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: (Colors.blueGrey[50])!),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 30),
        TextField(
          controller: passController,
          obscureText: isSeenPass ? false : true,
          decoration: InputDecoration(
            hintText: 'Mật khẩu',
            counterText: 'Quên mật khẩu?',
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  isSeenPass = !isSeenPass;
                  // print("click ok");
                });
              },
              child: const Icon(
                Icons.visibility_off_outlined,
                color: Colors.grey,
              ),
            ),
            filled: true,
            fillColor: Colors.blueGrey[50],
            labelStyle: const TextStyle(fontSize: 12),
            contentPadding: const EdgeInsets.only(left: 30),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: (Colors.blueGrey[50])!),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: (Colors.blueGrey[50])!),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        const SizedBox(height: 40),
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
            // ignore: avoid_print
            onPressed: () async {
              final username = usernameController.text;
              final password = passController.text;

              final user = User(username: username, password: password);
              final url = Uri.parse('https://reqres.in/api/login');
              final headers = {'Content-Type': 'application/json'};
              final body = json.encode(user.toJson());
              print(body);
              final response =
                  await http.post(url, headers: headers, body: body);
              final responseData = json.decode(response.body);
              // print(responseData['token']);
              if (responseData['token'] == 'QpwL5tke4Pnpja7X4') {
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreens()),
                );
              } else {
                // Đăng nhập thất bại, hiển thị thông báo lỗi ở đây
              }
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
                child: Center(child: Text("ĐĂNG NHẬP"))),
          ),
        ),
        const SizedBox(height: 40),
        Row(children: [
          Expanded(
            child: Divider(
              color: Colors.grey[300],
              height: 50,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Liên hệ với chúng tôi"),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey[400],
              height: 50,
            ),
          ),
        ]),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _loginWithButton(image: 'images/google.png'),
            _loginWithButton(image: 'images/github.png', isActive: true),
            _loginWithButton(image: 'images/facebook.png'),
          ],
        ),
      ],
    );
  }

  Widget _loginWithButton({required String image, bool isActive = false}) {
    return Container(
      width: 90,
      height: 70,
      decoration: isActive
          ? BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: (Colors.grey[300])!,
                  spreadRadius: 10,
                  blurRadius: 30,
                )
              ],
              borderRadius: BorderRadius.circular(15),
            )
          : BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: (Colors.grey[400])!),
            ),
      child: Center(
          child: Container(
        decoration: isActive
            ? BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: (Colors.grey[400])!,
                    spreadRadius: 2,
                    blurRadius: 15,
                  )
                ],
              )
            : const BoxDecoration(),
        child: Image.asset(
          image,
          width: 35,
        ),
      )),
    );
  }
}
