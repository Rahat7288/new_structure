import 'package:equatable/equatable.dart';

class LoginEntities extends Equatable{
  final String? userEmail;
  final String? userPassword;
  const LoginEntities({
    this.userEmail,
    this.userPassword,});

  @override
  List<Object?> get props => [userEmail, userPassword];

}