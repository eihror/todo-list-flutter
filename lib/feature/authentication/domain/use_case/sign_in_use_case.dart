import 'package:common/model/result.dart';
import 'package:todo_list/feature/authentication/domain/repository/authentication_repository.dart';

class SignInUseCase {
  SignInUseCase({
    required this.repository,
  });

  final AuthenticationRepository repository;

  Future<Result<void>> call({
    required String email,
    required String password,
  }) =>
      repository.signIn(email: email, password: password);
}
