// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CartItemEntity> _$cartItemEntitySerializer =
    new _$CartItemEntitySerializer();

class _$CartItemEntitySerializer
    implements StructuredSerializer<CartItemEntity> {
  @override
  final Iterable<Type> types = const [CartItemEntity, _$CartItemEntity];
  @override
  final String wireName = 'CartItemEntity';

  @override
  Iterable<Object?> serialize(Serializers serializers, CartItemEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(String)),
      'productId',
      serializers.serialize(object.productId,
          specifiedType: const FullType(String)),
      'productPrice',
      serializers.serialize(object.productPrice,
          specifiedType: const FullType(String)),
      'productName',
      serializers.serialize(object.productName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  CartItemEntity deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CartItemEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'productId':
          result.productId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'productPrice':
          result.productPrice = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'productName':
          result.productName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$CartItemEntity extends CartItemEntity {
  @override
  final String id;
  @override
  final String user;
  @override
  final String productId;
  @override
  final String productPrice;
  @override
  final String productName;

  factory _$CartItemEntity([void Function(CartItemEntityBuilder)? updates]) =>
      (new CartItemEntityBuilder()..update(updates))._build();

  _$CartItemEntity._(
      {required this.id,
      required this.user,
      required this.productId,
      required this.productPrice,
      required this.productName})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'CartItemEntity', 'id');
    BuiltValueNullFieldError.checkNotNull(user, r'CartItemEntity', 'user');
    BuiltValueNullFieldError.checkNotNull(
        productId, r'CartItemEntity', 'productId');
    BuiltValueNullFieldError.checkNotNull(
        productPrice, r'CartItemEntity', 'productPrice');
    BuiltValueNullFieldError.checkNotNull(
        productName, r'CartItemEntity', 'productName');
  }

  @override
  CartItemEntity rebuild(void Function(CartItemEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CartItemEntityBuilder toBuilder() =>
      new CartItemEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CartItemEntity &&
        id == other.id &&
        user == other.user &&
        productId == other.productId &&
        productPrice == other.productPrice &&
        productName == other.productName;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), user.hashCode), productId.hashCode),
            productPrice.hashCode),
        productName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CartItemEntity')
          ..add('id', id)
          ..add('user', user)
          ..add('productId', productId)
          ..add('productPrice', productPrice)
          ..add('productName', productName))
        .toString();
  }
}

class CartItemEntityBuilder
    implements Builder<CartItemEntity, CartItemEntityBuilder> {
  _$CartItemEntity? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _user;
  String? get user => _$this._user;
  set user(String? user) => _$this._user = user;

  String? _productId;
  String? get productId => _$this._productId;
  set productId(String? productId) => _$this._productId = productId;

  String? _productPrice;
  String? get productPrice => _$this._productPrice;
  set productPrice(String? productPrice) => _$this._productPrice = productPrice;

  String? _productName;
  String? get productName => _$this._productName;
  set productName(String? productName) => _$this._productName = productName;

  CartItemEntityBuilder();

  CartItemEntityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _user = $v.user;
      _productId = $v.productId;
      _productPrice = $v.productPrice;
      _productName = $v.productName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CartItemEntity other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CartItemEntity;
  }

  @override
  void update(void Function(CartItemEntityBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CartItemEntity build() => _build();

  _$CartItemEntity _build() {
    final _$result = _$v ??
        new _$CartItemEntity._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'CartItemEntity', 'id'),
            user: BuiltValueNullFieldError.checkNotNull(
                user, r'CartItemEntity', 'user'),
            productId: BuiltValueNullFieldError.checkNotNull(
                productId, r'CartItemEntity', 'productId'),
            productPrice: BuiltValueNullFieldError.checkNotNull(
                productPrice, r'CartItemEntity', 'productPrice'),
            productName: BuiltValueNullFieldError.checkNotNull(
                productName, r'CartItemEntity', 'productName'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
