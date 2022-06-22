// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CartItemResponse> _$cartItemResponseSerializer =
    new _$CartItemResponseSerializer();

class _$CartItemResponseSerializer
    implements StructuredSerializer<CartItemResponse> {
  @override
  final Iterable<Type> types = const [CartItemResponse, _$CartItemResponse];
  @override
  final String wireName = 'CartItemResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, CartItemResponse object,
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
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.products;
    if (value != null) {
      result
        ..add('products')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(CartItemPIdResponse)])));
    }
    value = object.productName;
    if (value != null) {
      result
        ..add('productName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productCategory;
    if (value != null) {
      result
        ..add('productCategory')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.productPrice;
    if (value != null) {
      result
        ..add('productPrice')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.productImage;
    if (value != null) {
      result
        ..add('productImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CartItemResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CartItemResponseBuilder();

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
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'products':
          result.products.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CartItemPIdResponse)]))!
              as BuiltList<Object?>);
          break;
        case 'productName':
          result.productName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'productCategory':
          result.productCategory = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'productPrice':
          result.productPrice = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'productImage':
          result.productImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$CartItemResponse extends CartItemResponse {
  @override
  final String? id;
  @override
  final String? user;
  @override
  final BuiltList<CartItemPIdResponse>? products;
  @override
  final String? productName;
  @override
  final String? productCategory;
  @override
  final int? productPrice;
  @override
  final String? productImage;

  factory _$CartItemResponse(
          [void Function(CartItemResponseBuilder)? updates]) =>
      (new CartItemResponseBuilder()..update(updates))._build();

  _$CartItemResponse._(
      {this.id,
      this.user,
      this.products,
      this.productName,
      this.productCategory,
      this.productPrice,
      this.productImage})
      : super._();

  @override
  CartItemResponse rebuild(void Function(CartItemResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CartItemResponseBuilder toBuilder() =>
      new CartItemResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CartItemResponse &&
        id == other.id &&
        user == other.user &&
        products == other.products &&
        productName == other.productName &&
        productCategory == other.productCategory &&
        productPrice == other.productPrice &&
        productImage == other.productImage;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), user.hashCode),
                        products.hashCode),
                    productName.hashCode),
                productCategory.hashCode),
            productPrice.hashCode),
        productImage.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CartItemResponse')
          ..add('id', id)
          ..add('user', user)
          ..add('products', products)
          ..add('productName', productName)
          ..add('productCategory', productCategory)
          ..add('productPrice', productPrice)
          ..add('productImage', productImage))
        .toString();
  }
}

class CartItemResponseBuilder
    implements Builder<CartItemResponse, CartItemResponseBuilder> {
  _$CartItemResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _user;
  String? get user => _$this._user;
  set user(String? user) => _$this._user = user;

  ListBuilder<CartItemPIdResponse>? _products;
  ListBuilder<CartItemPIdResponse> get products =>
      _$this._products ??= new ListBuilder<CartItemPIdResponse>();
  set products(ListBuilder<CartItemPIdResponse>? products) =>
      _$this._products = products;

  String? _productName;
  String? get productName => _$this._productName;
  set productName(String? productName) => _$this._productName = productName;

  String? _productCategory;
  String? get productCategory => _$this._productCategory;
  set productCategory(String? productCategory) =>
      _$this._productCategory = productCategory;

  int? _productPrice;
  int? get productPrice => _$this._productPrice;
  set productPrice(int? productPrice) => _$this._productPrice = productPrice;

  String? _productImage;
  String? get productImage => _$this._productImage;
  set productImage(String? productImage) => _$this._productImage = productImage;

  CartItemResponseBuilder();

  CartItemResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _user = $v.user;
      _products = $v.products?.toBuilder();
      _productName = $v.productName;
      _productCategory = $v.productCategory;
      _productPrice = $v.productPrice;
      _productImage = $v.productImage;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CartItemResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CartItemResponse;
  }

  @override
  void update(void Function(CartItemResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CartItemResponse build() => _build();

  _$CartItemResponse _build() {
    _$CartItemResponse _$result;
    try {
      _$result = _$v ??
          new _$CartItemResponse._(
              id: id,
              user: user,
              products: _products?.build(),
              productName: productName,
              productCategory: productCategory,
              productPrice: productPrice,
              productImage: productImage);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'products';
        _products?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CartItemResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
