import 'package:contactless_payment_app/domain/repositories/user_repository.dart';
import 'package:contactless_payment_app/utils/result.dart';

class LoginUseCase {
  final UserRepository _userRepository;

  const LoginUseCase(this._userRepository);

  UnitResultSingle call({
    required String email,
    required String password,
  }) =>
      _userRepository.login(email: email, password: password);
}
