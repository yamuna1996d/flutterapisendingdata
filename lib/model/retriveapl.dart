class RetriveModel{
  final String Name;
  final String Discription;
  final String Duration;
  final String Venue;
  final String Date;

  RetriveModel({this.Name, this.Discription, this.Duration, this.Venue,
      this.Date});
  factory RetriveModel.fromJson(Map<String,dynamic> json){
    return RetriveModel(
        Name: json['courseTitle'],
        Discription: json['courseDescription'],
        Duration: json['courseDuration'],
        Venue:json['courseVenue'],
        Date:json['courseDate'],);
  }
  Map toMap()
  {
    var map=new Map<String,dynamic>();

    map["courseTitle"]=Name;
    map["courseDescription"]=Discription;
    map["courseDuration"]=Duration;
    map["courseVenue"]=Venue;
    map["courseDate"]=Date;
    return map;
  }
}