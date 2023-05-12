class Schedule {
  final int id;
  final String gameDay;
  final String gameDayTime;
  final String gameDayAdds;
  final int seasonId;
  final int riderId;
  final int seasonResultId;
  final int userId;
  final int pointRiderByGame;

  Schedule({
    required this.id,
    required this.gameDay,
    required this.gameDayTime,
    required this.gameDayAdds,
    required this.seasonId,
    required this.riderId,
    required this.seasonResultId,
    required this.userId,
    required this.pointRiderByGame,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      id: json['id'],
      gameDay: json['gameDay'],
      gameDayTime: json['gameDayTime'],
      gameDayAdds: json['gameDayAdds'],
      seasonId: json['seasonId'],
      riderId: json['riderId'],
      seasonResultId: json['seasonResultId'],
      userId: json['userId'],
      pointRiderByGame: json['pointRiderByGame'],
    );
  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['gameDay'] = this.gameDay;
    data['gameDayTime'] = this.gameDayTime;
    data['gameDayAdds'] = this.gameDayAdds;
    data['seasonId'] = this.seasonId;
    data['riderId'] = this.riderId;
    data['seasonResultId'] = this.seasonResultId;
    data['userId'] = this.userId;
    data['pointRiderByGame'] = this.pointRiderByGame;
    return data;
  }
}
