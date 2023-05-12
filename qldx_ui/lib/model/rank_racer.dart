class RankRacer {
  int? id;
  String? name;
  int? point;
  String? team;

  RankRacer({this.name, this.id, this.team,this.point});

  factory RankRacer.fromJson(Map<String, dynamic> json) => RankRacer(
        name: json['name'] as String?,
        id: json['id'] as int?,
        point: json['time'] as int?,
        team: json['team'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'team': team,
        'id':id,
        'time':point,
      };
}
