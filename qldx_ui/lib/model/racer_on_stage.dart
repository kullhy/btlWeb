class RacerOnStage {
  int? id;
  String? name;
  int? time;
  String? team;

  RacerOnStage({this.name, this.id, this.team,this.time});

  factory RacerOnStage.fromJson(Map<String, dynamic> json) => RacerOnStage(
        name: json['name'] as String?,
        id: json['id'] as int?,
        time: json['time'] as int?,
        team: json['team'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'team': team,
        'id':id,
        'time':time,
      };
}
