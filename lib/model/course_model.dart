class CourseModel{
  final String sid;
  final String cname;
  final String cfee;
  final String inst;
  final String duration;

  CourseModel( {this.sid, this.cname, this.cfee,
      this.inst, this.duration });

  factory CourseModel.fromJson(Map<String,dynamic> json)
  {

    return CourseModel(
        sid: json['Studentid'],
        cname: json['Coursename'],
        cfee: json['fee'],
        inst:json['Institute'],
        duration:json['Duration'],
    );
  }


  Map toMap()
  {
    var map=new Map<String,dynamic>();

    map["Studentid"]=sid;
    map["Coursename"]=cname;
    map["fee"]=cfee;
    map["Institute"]=inst;
    map["Duration"]=duration;
    return map;
  }
}