class RaceStage {
  final int id;
  final String name;
  final int racermember;

  RaceStage({required this.name, required this.racermember, required this.id});
  Map<String, dynamic> toJson() =>
      {'email': name, 'password': racermember, 'id': id};
  factory RaceStage.fromJson(Map<String, dynamic> json) {
    return RaceStage(
      id: json['id'],
      name: json['name'],
      racermember: json['racermember'],
    );
  }
}
