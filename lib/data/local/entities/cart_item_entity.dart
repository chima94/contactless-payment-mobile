import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:contactless_payment_app/data/serializer.dart';

part 'cart_item_entity.g.dart';

abstract class CartItemEntity
    implements Built<CartItemEntity, CartItemEntityBuilder> {
  String get id;
  String get user;
  String get productId;
  String get productPrice;
  String get productName;

  static Serializer<CartItemEntity> get serializer =>
      _$cartItemEntitySerializer;
  CartItemEntity._();

  factory CartItemEntity([void Function(CartItemEntityBuilder) updates]) =
      _$CartItemEntity;

  factory CartItemEntity.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith<CartItemEntity>(serializer, json)!;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(serializer, this) as Map<String, dynamic>;
}
