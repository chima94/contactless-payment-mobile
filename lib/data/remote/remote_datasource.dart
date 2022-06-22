import 'package:contactless_payment_app/data/remote/response/add_cart_response.dart';
import 'package:contactless_payment_app/data/remote/response/cart_item_response.dart';
import 'package:contactless_payment_app/data/remote/response/token_response.dart';
import 'package:contactless_payment_app/data/remote/response/user_response.dart';

abstract class RemoteDatasource {
  Future<TokenResponse> loginUser(
    String email,
    String password,
  );

  Future<UserResponse> getUserProfile(String token);
  Future<AddCartResponse> addToCart(String token, String productId);
  Future<List<CartItemResponse>> cartItems(String token);
}
