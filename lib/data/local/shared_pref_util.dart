import 'dart:async';
import 'dart:convert';

import 'package:contactless_payment_app/data/exception/local_datasource_exception.dart';
import 'package:contactless_payment_app/data/local/entities/user_and_token_entity.dart';
import 'package:contactless_payment_app/data/local/local_datasource.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:rxdart/rxdart.dart';

class SharedPrefUtil implements LocalDataSource {
  final RxSharedPreferences _rxPrefs;
  const SharedPrefUtil(this._rxPrefs);
  static const _kUserTokenKey = 'auth_user_token';

  @override
  Stream<UserAndTokenEntity?> get userAndToken$ => _rxPrefs
      .observe<UserAndTokenEntity>(_kUserTokenKey, _toEntity)
      .onErrorReturnWith(
        (e, s) =>
            throw LocalDataSourceException('Cannot read user and token', e, s),
      );

  @override
  Future<UserAndTokenEntity?> get userAndToken => _rxPrefs
      .read<UserAndTokenEntity>(_kUserTokenKey, _toEntity)
      .onError<Object>(
        (e, s) =>
            throw LocalDataSourceException('Cannot read user and token', e, s),
      );

  @override
  Future<void> removeUserAndToken() =>
      _rxPrefs.remove(_kUserTokenKey).onError<Object>((e, s) =>
          throw LocalDataSourceException('Cannot delete user and token', e, s));

  @override
  Future<void> saveUserAndToken(UserAndTokenEntity userAndTokenEntity) {
    return _rxPrefs
        .write<UserAndTokenEntity>(
            _kUserTokenKey, userAndTokenEntity, _toString)
        .onError<Object>((error, stackTrace) => throw LocalDataSourceException(
            'Cannot save user and token', error, stackTrace));
  }

  FutureOr<String?> _toString(UserAndTokenEntity? entity) =>
      entity == null ? null : jsonEncode(entity);

  FutureOr<UserAndTokenEntity?> _toEntity(dynamic jsonString) =>
      jsonString == null
          ? null
          : UserAndTokenEntity.fromJson(jsonDecode(jsonString));
}
