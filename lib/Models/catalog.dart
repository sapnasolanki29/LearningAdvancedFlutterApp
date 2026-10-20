class Course {
  final int id;
  final String name;
  final String desc;
  final String image;
  final String avgSalary;
  final String category;
  final String duration;
  final String demand;
  final String fee;
  final String suitableFor;


  Course({required this.id, required this.name, required this.desc, required this.image, required this.avgSalary,
    required this.category, required this.duration, required this.demand, required this.fee, required this.suitableFor});

  factory Course.fromMap(Map<String, dynamic> map){
    return Course(
        id:map["id"]??"",
        name: map["name"]??"",
        desc: map["description"]??"",
        image: map["imageUrl"]??"",
        avgSalary: map["salary"]??"",
        category: map["category"]??"",
        duration: map["duration"]??"",
        demand: map["demand"]??"",
        fee: map["fee"]??"",
        suitableFor: map["suitableFor"]??""
    );

  }


}