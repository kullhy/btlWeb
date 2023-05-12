class Racer {
  String? name;
  String? date;
  String? tel;
  String? email;
  String? team;
  String? address;

  Racer({
    this.name,
    this.date,
    this.tel,
    this.email,
    this.team,
    this.address,
  });

  factory Racer.fromJson(Map<String, dynamic> json) => Racer(
        name: json['name'] as String?,
        date: json['date'] as String?,
        tel: json['tel'] as String?,
        email: json['email'] as String?,
        team: json['team'] as String?,
        address: json['address'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'date': date,
        'tel': tel,
        'email': email,
        'team': team,
        'address': address,
      };
}
