class User {
  final int id;
  final String name;
  final String? email;
  final String? address;
  final String? mobile;
  final String? profession;
  final String? image;
  const User({required this.id, this.email, required this.name,  this.address,  this.mobile,
     this.profession, this.image});

}