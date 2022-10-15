class Students {
  late String name;
  late String email;
  late String phone;
  late String course;
  late int fee;
  late int? id;

  Students({
    required this.name,
    required this.email,
    required this.phone,
    required this.course,
    required this.fee,
    this.id,
  });

  //Funtion to Convert Object to Map
  Map<String, dynamic> tomap() {
    Map<String, dynamic> map = {};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['course'] = course;
    map['fee'] = fee;
    map['id'] = id;

    return map;
  }

  //Funtion to Convert Map to Object
  Students.FromMap(Map<String, dynamic> mapp) {
    name = mapp['name'];
    email = mapp['email'];
    phone = mapp['phone'];
    course = mapp['course'];
    fee = mapp['fee'];
    id = mapp['id'];
  }
}
