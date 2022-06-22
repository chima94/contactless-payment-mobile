import 'package:contactless_payment_app/data/constant.dart';
import 'package:contactless_payment_app/data/remote/network_util.dart';
import 'package:contactless_payment_app/data/remote/remote_datasource.dart';
import 'package:contactless_payment_app/data/remote/response/add_cart_response.dart';
import 'package:contactless_payment_app/data/remote/response/cart_item_response.dart';

import 'package:contactless_payment_app/data/remote/response/token_response.dart';
import 'package:contactless_payment_app/data/remote/response/user_response.dart';

class ApiService implements RemoteDatasource {
  static const String xAccessToken = 'x-access-token';
  const ApiService();

  @override
  Future<TokenResponse> loginUser(String email, String password) async {
    final url = Uri.http(baseUrl, '/api/auth');
    final json = await NetworkUtils.post(url, headers: <String, String>{
      'Content-Type': 'application/json',
    }, body: <String, String>{
      'email': email,
      'password': password,
    });
    return TokenResponse.fromJson(json);
  }

  @override
  Future<UserResponse> getUserProfile(String token) async {
    final url = Uri.https(baseUrl, '/api/auth');
    final json = await NetworkUtils.get(url, token, headers: {
      'x-auth-token': token,
    });
    return UserResponse.fromJson(json);
  }

  @override
  Future<AddCartResponse> addToCart(String token, String productId) async {
    final url = Uri.http(baseUrl, '/api/cart');
    final json = await NetworkUtils.post(url, headers: <String, String>{
      'Content-Type': 'application/json',
      'x-auth-token': token
    }, body: <String, String>{
      'productId': productId
    });
    return AddCartResponse.fromJson(json);
  }

  @override
  Future<List<CartItemResponse>> cartItems(String token) async {
    final url = Uri.https(baseUrl, '/api/cart');
    final json = await NetworkUtils.get(url, token, headers: {
      'x-auth-token': token,
    });
    final items = List<Map>.from(json as List)
        .map((jsonMap) =>
            CartItemResponse.fromJson(Map<String, dynamic>.from(jsonMap)))
        .toList();

    return items;
  }
}
