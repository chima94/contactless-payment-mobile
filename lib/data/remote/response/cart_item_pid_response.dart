import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:contactless_payment_app/data/serializer.dart';

part 'cart_item_pid_response.g.dart';

abstract class CartItemPIdResponse
    implements Built<CartItemPIdResponse, CartItemPIdResponseBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  String? get productId;

  static Serializer<CartItemPIdResponse> get serializer =>
      _$cartItemPIdResponseSerializer;

  CartItemPIdResponse._();

  factory CartItemPIdResponse(
          [void Function(CartItemPIdResponseBuilder) updates]) =
      _$CartItemPIdResponse;

  factory CartItemPIdResponse.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith<CartItemPIdResponse>(serializer, json)!;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(serializer, this) as Map<String, dynamic>;
}
