import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:contactless_payment_app/data/remote/response/cart_item_pid_response.dart';
import 'package:contactless_payment_app/data/serializer.dart';

part 'cart_item_response.g.dart';

abstract class CartItemResponse
    implements Built<CartItemResponse, CartItemResponseBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get user;
  BuiltList<CartItemPIdResponse>? get products;
  String? get productName;
  String? get productCategory;
  int? get productPrice;
  String? get productImage;

  static Serializer<CartItemResponse> get serializer =>
      _$cartItemResponseSerializer;

  CartItemResponse._();

  factory CartItemResponse([void Function(CartItemResponseBuilder) updates]) =
      _$CartItemResponse;
  factory CartItemResponse.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith<CartItemResponse>(serializer, json)!;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(serializer, this) as Map<String, dynamic>;
}
