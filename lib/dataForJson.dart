class DataForJson {
  String firstName;
  String lastName;
  String occupation;
  String phoneNo;
  int gender = 0; // !- 0-Male 1-Female 2-Other
  String imagePath;

  DataForJson({this.firstName, this.lastName, this.occupation, this.phoneNo, this.gender, this.imagePath});

  factory DataForJson.fromJson(Map<String, dynamic> json){
    return DataForJson(
      firstName: json['firstName'],
      lastName: json['lastName'],
      occupation: json['occupation'],
      phoneNo: json['phoneNo'],
      gender: json['gender'],
      imagePath: json['imagePath'], // !- Image ?
    );
  }

}