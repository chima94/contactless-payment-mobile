// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_cart_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AddCartResponse> _$addCartResponseSerializer =
    new _$AddCartResponseSerializer();

class _$AddCartResponseSerializer
    implements StructuredSerializer<AddCartResponse> {
  @override
  final Iterable<Type> types = const [AddCartResponse, _$AddCartResponse];
  @override
  final String wireName = 'AddCartResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, AddCartResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.success;
    if (value != null) {
      result
        ..add('success')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AddCartResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AddCartResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'success':
          result.success = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$AddCartResponse extends AddCartResponse {
  @override
  final String? success;

  factory _$AddCartResponse([void Function(AddCartResponseBuilder)? updates]) =>
      (new AddCartResponseBuilder()..update(updates))._build();

  _$AddCartResponse._({this.success}) : super._();

  @override
  AddCartResponse rebuild(void Function(AddCartResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddCartResponseBuilder toBuilder() =>
      new AddCartResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddCartResponse && success == other.success;
  }

  @override
  int get hashCode {
    return $jf($jc(0, success.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddCartResponse')
          ..add('success', success))
        .toString();
  }
}

class AddCartResponseBuilder
    implements Builder<AddCartResponse, AddCartResponseBuilder> {
  _$AddCartResponse? _$v;

  String? _success;
  String? get success => _$this._success;
  set success(String? success) => _$this._success = success;

  AddCartResponseBuilder();

  AddCartResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _success = $v.success;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddCartResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddCartResponse;
  }

  @override
  void update(void Function(AddCartResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddCartResponse build() => _build();

  _$AddCartResponse _build() {
    final _$result = _$v ?? new _$AddCartResponse._(success: success);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
