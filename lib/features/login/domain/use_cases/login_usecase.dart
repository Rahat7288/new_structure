import 'package:new_structure/core/resources/use_case.dart';

import '../../../../core/resources/data_state.dart';
import '../../data/models/login_model.dart';
import '../entities/login_entities.dart';
import '../repository/login_repository.dart';

class LoginUseCase implements UseCase<DataState<LoginModel>, LoginEntities>{
  final LoginRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<DataState<LoginModel>> call(LoginEntities entities) async {

    throw _repository.login(entities);
  }
}