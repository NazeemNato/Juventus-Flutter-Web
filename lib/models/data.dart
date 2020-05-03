class PlayerData {
  String name,position,country,dateAndMonth,dob,image;
  PlayerData({
    this.name,
    this.position,
    this.country,
    this.dateAndMonth,
    this.dob,
    this.image
  });
  factory PlayerData.fromJson(Map<String,dynamic> json){
    return PlayerData(
      name: json["Name"] as String,
      position: json["Position"] as String,
      country: json["Country"] as String,
      dateAndMonth: json["DateAndMonth"] as String,
      dob: json["DOB"] as String,
      image: json["image"] as String
    );
  }
}