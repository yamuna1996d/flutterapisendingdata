class StudentModel{
  final String Name;
  final String Email;
  final String place;
  final String phone;
  final String parent;
  final String parentphone;

  StudentModel( {this.Name, this.Email, this.place,
    this.phone, this.parent,this.parentphone});

  factory StudentModel.fromJson(Map<String,dynamic> json)
  {

    return StudentModel(
      Name: json['Name'],
      Email: json['email'],
      place: json['place'],
      phone:json['phone'],
      parent:json['parentname'],
      parentphone:json['parentPhone'],
    );
  }


  Map toMap()
  {
    var map=new Map<String,dynamic>();

    map["Name"]=Name;
    map["email"]=Email;
    map["place"]=place;
    map["phone"]=phone;
    map["parentname"]=parent;
    map["parentPhone"]=parentphone;
    return map;
  }
}