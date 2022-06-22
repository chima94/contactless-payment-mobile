import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:contactless_payment_app/data/local/entities/cart_item_entity.dart';
import 'package:contactless_payment_app/data/local/entities/user_and_token_entity.dart';
import 'package:contactless_payment_app/data/local/entities/user_entity.dart';
import 'package:contactless_payment_app/data/remote/response/add_cart_response.dart';
import 'package:contactless_payment_app/data/remote/response/cart_item_pid_response.dart';
import 'package:contactless_payment_app/data/remote/response/cart_item_response.dart';
import 'package:contactless_payment_app/data/remote/response/token_response.dart';
import 'package:contactless_payment_app/data/remote/response/user_response.dart';

part 'serializer.g.dart';

@SerializersFor([
  TokenResponse,
  UserResponse,
  AddCartResponse,
  CartItemResponse,
  CartItemPIdResponse,
  UserEntity,
  UserAndTokenEntity,
  CartItemEntity,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..add(Iso8601DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();
