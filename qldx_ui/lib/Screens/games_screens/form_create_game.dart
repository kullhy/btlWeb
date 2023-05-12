import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FormCreateGame extends StatefulWidget {
  const FormCreateGame({super.key});

  @override
  State<FormCreateGame> createState() => _FormCreateGameState();
}

class _FormCreateGameState extends State<FormCreateGame> {
  late int id, seasonId, riderId, pointRiderByGame, seasonResultId, userId;
  late String gameDay, gameDayTime, gameDayAdds;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'ID'),
            onChanged: (value) {
              // Lưu giá trị vào biến id
              id = int.parse(value);
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Ngày đá'),
            onChanged: (value) {
              // Lưu giá trị vào biến gameDay
              gameDay = value;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Giờ đá'),
            onChanged: (value) {
              // Lưu giá trị vào biến gameDayTime
              gameDayTime = value;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Địa điểm đá'),
            onChanged: (value) {
              // Lưu giá trị vào biến gameDayAdds
              gameDayAdds = value;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'ID mùa giải'),
            onChanged: (value) {
              // Lưu giá trị vào biến seasonId
              seasonId = int.parse(value);
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'ID người chơi'),
            onChanged: (value) {
              // Lưu giá trị vào biến riderId
              riderId = int.parse(value);
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'ID kết quả mùa giải'),
            onChanged: (value) {
              // Lưu giá trị vào biến seasonResultId
              seasonResultId = int.parse(value);
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'ID người dùng'),
            onChanged: (value) {
              // Lưu giá trị vào biến userId
              userId = int.parse(value);
            },
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Điểm người chơi'),
            onChanged: (value) {
              // Lưu giá trị vào biến pointRiderByGame
              pointRiderByGame = int.parse(value);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () async {
              // Tạo một Map để chứa các giá trị đã nhập
              Map<String, dynamic> data = {
                "id": id,
                "gameDay": gameDay,
                "gameDayTime": gameDayTime,
                "gameDayAdds": gameDayAdds,
                "seasonId": seasonId,
                "riderId": riderId,
                "seasonResultId": seasonResultId,
                "userId": userId,
                "pointRiderByGame": pointRiderByGame,
              };

              // Đóng gói Map thành một chuỗi JSON
              String json = jsonEncode(data);
              print(data);

              // Gửi chuỗi JSON lên server
              // ở đây chúng ta sử dụng thư viện http của Flutter
              http.Response response = await http.post(
                'https://example.com/post-data' as Uri,
                headers: {'Content-Type': 'application/json'},
                body: json,
              );

// Kiểm tra kết quả trả về từ server
              if (response.statusCode == 200) {
                // Nếu thành công, hiển thị thông báo
                // ignore: use_build_context_synchronously
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Thành công'),
                      content: const Text('Dữ liệu đã được gửi lên server.'),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              } else {
                // Nếu không thành công, hiển thị thông báo lỗi
                // ignore: use_build_context_synchronously
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Lỗi'),
                      content: const Text('Đã có lỗi xảy ra.'),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: const Text('Gửi'),
          ),
        ]),
      ),
    );
  }
}
