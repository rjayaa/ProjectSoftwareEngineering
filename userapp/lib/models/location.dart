class Location {
  String? name;
  String? phoneNumber;
  String? floorNumber;
  String? retrieveTime;
  String? detailLocation;

  Location({
    this.name,
    this.phoneNumber,
    this.floorNumber,
    this.retrieveTime,
    this.detailLocation,
  });

  Location.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    phoneNumber = json["phoneNumber"];
    floorNumber = json["floorNumber"];
    retrieveTime = json["retrieveTime"];
    detailLocation = json["detailLocation"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['phoneNumber'] = phoneNumber;
    data['floorNumber'] = floorNumber;
    data['retrieveTime'] = retrieveTime;
    data['detailLocation'] = detailLocation;

    return data;
  }
}
