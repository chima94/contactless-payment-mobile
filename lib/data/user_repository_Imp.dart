import 'dart:io';
import 'package:contactless_payment_app/data/exception/local_datasource_exception.dart';
import 'package:contactless_payment_app/data/exception/remote_data_source_exception.dart';
import 'package:contactless_payment_app/data/local/entities/mappers.dart';
import 'package:contactless_payment_app/data/local/entities/user_and_token_entity.dart';
import 'package:contactless_payment_app/data/local/local_datasource.dart';
import 'package:contactless_payment_app/data/remote/remote_datasource.dart';
import 'package:contactless_payment_app/data/remote/response/add_cart_response.dart';
import 'package:contactless_payment_app/data/remote/response/cart_item_response.dart';
import 'package:contactless_payment_app/data/remote/response/user_response.dart';
import 'package:contactless_payment_app/domain/repositories/user_repository.dart';
import 'package:contactless_payment_app/utils/result.dart';
import 'package:flutter/material.dart';
import 'package:rxdart_ext/rxdart_ext.dart';
import 'package:tuple/tuple.dart';

class UserRepositoryImp extends UserRepository {
  final RemoteDatasource _remoteDatasource;
  final LocalDataSource _localDataSource;
  UserRepositoryImp(this._remoteDatasource, this._localDataSource);

  @override
  Stream<UserAndTokenEntity?> get userAndToken$ =>
      _localDataSource.userAndToken$;

  @override
  Future<UserAndTokenEntity?> get userAndToken => _localDataSource.userAndToken;

  @override
  UnitResultSingle login({
    required String email,
    required String password,
  }) {
    return _excute(() => _remoteDatasource.loginUser(email, password))
        .flatMapResult((result) {
          final token = result.token!;
          return _excute(
            () => _remoteDatasource
                .getUserProfile(token)
                .then((user) => Tuple2(user, token)),
          );
        })
        .flatMapResult((tuple) => _excute(() => _localDataSource
            .saveUserAndToken(Mappers.userResponseToUserAndTokenEntity(
                tuple.item1, tuple.item2))))
        .asUnit();
  }

  @override
  Future<UserResponse> getUserProfile({required String token}) async {
    final user = await _remoteDatasource.getUserProfile(token);
    await _localDataSource.saveUserAndToken(
        Mappers.userResponseToUserAndTokenEntity(user, token));
    return user;
  }

  @override
  Future<AddCartResponse> addToCart({
    required String token,
    required String productId,
  }) {
    return _remoteDatasource.addToCart(token, productId);
  }

  @override
  Future<List<CartItemResponse>> cartItems({required String token}) {
    return _remoteDatasource.cartItems(token);
  }

  @override
  Future<void> topupWallet({required int amount, required String token}) async {
    final user = await _remoteDatasource.topupWallet(amount, token);
    await _localDataSource.saveUserAndToken(
        Mappers.userResponseToUserAndTokenEntity(user, token));
  }

  Single<Result<T>> _excute<T>(Future<T> Function() factory) =>
      Single.fromCallable(factory)
          .doOnError(_handleUnauthenticatedError)
          .map<Result<T>>((value) => Success<T>(value))
          .onErrorReturnWith(_errorToResult);

  void _handleUnauthenticatedError(Object e, StackTrace? s) {
    if (e is RemoteDataSourceException &&
        e.statusCode == HttpStatus.unauthorized) {
      debugPrint(
          '[USER_REPOSITORY] {interceptor} 401 - unauthenticated error ===> login again');
      _localDataSource.removeUserAndToken();
    }
  }

  static Failure _errorToResult(Object e, StackTrace s) {
    if (e is RemoteDataSourceException) {
      return Failure(message: e.message, error: e.statusCode);
    }
    if (e is LocalDataSourceException) {
      return Failure(message: e.message, error: e);
    }
    return Failure(message: e.toString(), error: e);
  }
}
