class LoginModel {
  String id;
  String email;
  String password;

  LoginModel({
    required this.id,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
    };
  }

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      id: json['id'],
      email: '',
      password: '',
    );
  }

  @override
  String toString() {
    return 'TaskModel{id: $id, email: $email, password: $password}';
  }
}
