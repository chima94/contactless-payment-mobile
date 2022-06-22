// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_pid_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CartItemPIdResponse> _$cartItemPIdResponseSerializer =
    new _$CartItemPIdResponseSerializer();

class _$CartItemPIdResponseSerializer
    implements StructuredSerializer<CartItemPIdResponse> {
  @override
  final Iterable<Type> types = const [
    CartItemPIdResponse,
    _$CartItemPIdResponse
  ];
  @override
  final String wireName = 'CartItemPIdResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CartItemPIdResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productId;
    if (value != null) {
      result
        ..add('productId')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CartItemPIdResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CartItemPIdResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '_id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'productId':
          result.productId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$CartItemPIdResponse extends CartItemPIdResponse {
  @override
  final String? id;
  @override
  final String? productId;

  factory _$CartItemPIdResponse(
          [void Function(CartItemPIdResponseBuilder)? updates]) =>
      (new CartItemPIdResponseBuilder()..update(updates))._build();

  _$CartItemPIdResponse._({this.id, this.productId}) : super._();

  @override
  CartItemPIdResponse rebuild(
          void Function(CartItemPIdResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CartItemPIdResponseBuilder toBuilder() =>
      new CartItemPIdResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CartItemPIdResponse &&
        id == other.id &&
        productId == other.productId;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), productId.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CartItemPIdResponse')
          ..add('id', id)
          ..add('productId', productId))
        .toString();
  }
}

class CartItemPIdResponseBuilder
    implements Builder<CartItemPIdResponse, CartItemPIdResponseBuilder> {
  _$CartItemPIdResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _productId;
  String? get productId => _$this._productId;
  set productId(String? productId) => _$this._productId = productId;

  CartItemPIdResponseBuilder();

  CartItemPIdResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _productId = $v.productId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CartItemPIdResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CartItemPIdResponse;
  }

  @override
  void update(void Function(CartItemPIdResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CartItemPIdResponse build() => _build();

  _$CartItemPIdResponse _build() {
    final _$result =
        _$v ?? new _$CartItemPIdResponse._(id: id, productId: productId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
