class Datum {
	int? id;
	String? gameDay;
	String? gameDayTime;
	String? gameDayAdds;
	int? seasonId;
	int? riderId;
	int? seasonResultId;
	int? userId;
	int? pointRiderByGame;

	Datum({
		this.id, 
		this.gameDay, 
		this.gameDayTime, 
		this.gameDayAdds, 
		this.seasonId, 
		this.riderId, 
		this.seasonResultId, 
		this.userId, 
		this.pointRiderByGame, 
	});

	factory Datum.fromJson(Map<String, dynamic> json) => Datum(
				id: json['id'] as int?,
				gameDay: json['gameDay'] as String?,
				gameDayTime: json['gameDayTime'] as String?,
				gameDayAdds: json['gameDayAdds'] as String?,
				seasonId: json['seasonId'] as int?,
				riderId: json['riderId'] as int?,
				seasonResultId: json['seasonResultId'] as int?,
				userId: json['userId'] as int?,
				pointRiderByGame: json['pointRiderByGame'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'gameDay': gameDay,
				'gameDayTime': gameDayTime,
				'gameDayAdds': gameDayAdds,
				'seasonId': seasonId,
				'riderId': riderId,
				'seasonResultId': seasonResultId,
				'userId': userId,
				'pointRiderByGame': pointRiderByGame,
			};
}
