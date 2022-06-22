import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../serializer.dart';

part 'token_response.g.dart';

abstract class TokenResponse
    implements Built<TokenResponse, TokenResponseBuilder> {
  String? get token;

  static Serializer<TokenResponse> get serializer => _$tokenResponseSerializer;

  TokenResponse._();

  factory TokenResponse([void Function(TokenResponseBuilder) updates]) =
      _$TokenResponse;

  factory TokenResponse.fromJson(Map<String, dynamic> json) =>
      serializers.deserializeWith<TokenResponse>(serializer, json)!;

  Map<String, dynamic> toJson() =>
      serializers.serializeWith(serializer, this) as Map<String, dynamic>;
}
