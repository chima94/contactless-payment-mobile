import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:contactless_payment_app/data/serializer.dart';

part 'user_entity.g.dart';

abstract class UserEntity implements Built<UserEntity, UserEntityBuilder> {
  String get name;
  String get email;
  String get date;

  static Serializer<UserEntity> get serializer => _$userEntitySerializer;

  UserEntity._();

  factory UserEntity([void Function(UserEntityBuilder) updates]) = _$UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith<UserEntity>(serializer, json)!;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(serializer, this) as Map<String, dynamic>;
}
