import 'package:contactless_payment_app/data/local/entities/user_and_token_entity.dart';
import 'package:contactless_payment_app/data/remote/response/add_cart_response.dart';
import 'package:contactless_payment_app/data/remote/response/cart_item_response.dart';
import 'package:contactless_payment_app/data/remote/response/user_response.dart';
import 'package:contactless_payment_app/utils/result.dart';

abstract class UserRepository {
  UnitResultSingle login({
    required String email,
    required String password,
  });
  Stream<UserAndTokenEntity?> get userAndToken$;
  Future<UserAndTokenEntity?> get userAndToken;

  Future<UserResponse> getUserProfile({required String token});
  Future<AddCartResponse> addToCart(
      {required String token, required String productId});

  Future<List<CartItemResponse>> cartItems({required String token});
}
