
import '../../domain/entities/login_entities.dart';

class LoginModel extends LoginEntities {
  const LoginModel({
    String? email,
    String? password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'] ?? "",
      password: json['password'] ?? "",
    );
  }

  factory LoginModel.fromEntities(LoginEntities entities) {
    return LoginModel(
        email: entities.userEmail,
        password: entities.userPassword,
    );
  }
}