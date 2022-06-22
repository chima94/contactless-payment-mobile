import 'package:contactless_payment_app/data/local/entities/cart_item_entity.dart';
import 'package:contactless_payment_app/data/local/entities/user_and_token_entity.dart';
import 'package:contactless_payment_app/data/local/entities/user_entity.dart';
import 'package:contactless_payment_app/data/remote/response/cart_item_response.dart';
import 'package:contactless_payment_app/data/remote/response/user_response.dart';
import 'package:contactless_payment_app/domain/model/cart_item.dart';
import 'package:contactless_payment_app/domain/model/user.dart';
import 'package:contactless_payment_app/domain/model/user_and_token.dart';

//part of 'user_repository_imp.dart';

class Mappers {
  static UserAndTokenBuilder userTokenEntityToDomain(
      UserAndTokenEntity? entity) {
    return UserAndTokenBuilder()
      ..user = userEntityToUserDomain(entity?.user)
      ..token = entity?.token;
  }

  static UserBuilder userEntityToUserDomain(UserEntity? userEntity) {
    return UserBuilder()
      ..name = userEntity?.name
      ..email = userEntity?.email
      ..date = userEntity?.date;
  }

  static UserEntityBuilder userResponseToUserEntity(UserResponse userResponse) {
    return UserEntityBuilder()
      ..name = userResponse.name
      ..email = userResponse.email
      ..date = userResponse.date;
  }

  static UserAndTokenEntity userResponseToUserAndTokenEntity(
      UserResponse user, String token) {
    return UserAndTokenEntity(
      (b) => b
        ..token = token
        ..user = userResponseToUserEntity(user),
    );
  }

  static Iterable<CartItem> cartItemResponseToModel(
      List<CartItemResponse> cartItemResponse) {
    //print(cartItemResponse.map((item) => item.products?.length));
    return cartItemResponse.map((cartItem) => CartItem().copyWith(
          id: cartItem.id,
          productQty: cartItem.products?.length,
          productName: cartItem.productName,
          productPrice: cartItem.productPrice,
          productCategory: cartItem.productCategory,
          user: cartItem.user,
          imageUri: cartItem.productImage,
        ));
  }
}
