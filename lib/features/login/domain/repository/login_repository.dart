import 'package:new_structure/features/login/data/models/login_model.dart';

import '../entities/login_entities.dart';

abstract class LoginRepository {
  Future<LoginModel> login(LoginEntities entities);
}