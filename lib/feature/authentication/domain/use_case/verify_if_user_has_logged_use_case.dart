import 'package:common/model/result.dart';
import 'package:todo_list/feature/authentication/domain/repository/authentication_repository.dart';

class VerifyIfUserHasLoggedUseCase {
  VerifyIfUserHasLoggedUseCase({
    required this.repository,
  });

  final AuthenticationRepository repository;

  Future<Result<bool>> call() {
    return repository.verifyIfUserHasLogged();
  }
}
