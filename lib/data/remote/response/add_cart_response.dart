import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:contactless_payment_app/data/serializer.dart';

part 'add_cart_response.g.dart';

abstract class AddCartResponse
    implements Built<AddCartResponse, AddCartResponseBuilder> {
  String? get success;

  static Serializer<AddCartResponse> get serializer =>
      _$addCartResponseSerializer;
  AddCartResponse._();

  factory AddCartResponse([void Function(AddCartResponseBuilder) updates]) =
      _$AddCartResponse;

  factory AddCartResponse.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith<AddCartResponse>(serializer, json)!;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(serializer, this) as Map<String, dynamic>;
}
