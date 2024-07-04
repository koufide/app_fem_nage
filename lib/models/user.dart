class User {
  final String id;
  final String name;
  // final String email;
  final String tel;

  User({required this.id, required this.name, required this.tel});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'],
      name: json['name'],
      tel: json['tel'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name':name,
      'tel':tel,
    };
  }


} // User
