import 'package:contactless_payment_app/data/local/entities/user_and_token_entity.dart';

abstract class LocalDataSource {
  Stream<UserAndTokenEntity?> get userAndToken$;

  Future<UserAndTokenEntity?> get userAndToken;

  Future<void> saveUserAndToken(UserAndTokenEntity userAndTokenEntity);

  Future<void> removeUserAndToken();
}
