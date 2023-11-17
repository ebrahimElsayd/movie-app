class MovieModel{
  String? id;
  String title;
  String photo;
  num date;
  MovieModel({this.id,
    required this.title,
    required this.date,
    required this.photo});

  factory MovieModel.fromFireStore(Map<String, dynamic> json){
    return MovieModel(
        id: json["id"],
        title: json["title"],
        date: json["date"],
        photo: json["photo"]
    );
  }

   Map<String, dynamic> toFireStore(){
     return {
       "id" : id,
       "title" : title,
       "photo" : photo,
       "date" : date,
     };
}
}