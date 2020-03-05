class CourseModel{
  final String CourseTitle;
  final String CourseDiscription;
  final String CourseDuration;
  final String CourseVenue;
  final String CourseDate;

  CourseModel( {this.CourseTitle, this.CourseDiscription, this.CourseDuration,
      this.CourseVenue, this.CourseDate });

  factory CourseModel.fromJson(Map<String,dynamic> json)
  {

    return CourseModel(
        CourseTitle: json['courseTitle'],
        CourseDiscription: json['courseDescription'],
        CourseDuration: json['courseDuration'],
        CourseVenue:json['courseVenue'],
        CourseDate:json['courseDate'],
    );
  }


  Map toMap()
  {
    var map=new Map<String,dynamic>();

    map["courseTitle"]=CourseTitle;
    map["courseDescription"]=CourseDiscription;
    map["courseDuration"]=CourseDuration;
    map["courseVenue"]=CourseVenue;
    map["courseDate"]=CourseDate;
    return map;
  }
}