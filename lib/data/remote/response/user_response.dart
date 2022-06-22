import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:contactless_payment_app/data/serializer.dart';

part 'user_response.g.dart';

abstract class UserResponse
    implements Built<UserResponse, UserResponseBuilder> {
  String get name;
  String get email;
  String get date;

  static Serializer<UserResponse> get serializer => _$userResponseSerializer;

  UserResponse._();

  factory UserResponse([void Function(UserResponseBuilder) updates]) =
      _$UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith<UserResponse>(serializer, json)!;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(serializer, this) as Map<String, dynamic>;
}
