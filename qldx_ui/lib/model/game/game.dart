import 'datum.dart';

class Game {
	String? message;
	List<Datum>? data;

	Game({this.message, this.data});

	factory Game.fromJson(Map<String, dynamic> json) => Game(
				message: json['message'] as String?,
				data: (json['data'] as List<dynamic>?)
						?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'data': data?.map((e) => e.toJson()).toList(),
			};
}
