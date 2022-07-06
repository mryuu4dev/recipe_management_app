// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'operations.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GFetchRecipeListVars> _$gFetchRecipeListVarsSerializer =
    new _$GFetchRecipeListVarsSerializer();

class _$GFetchRecipeListVarsSerializer
    implements StructuredSerializer<GFetchRecipeListVars> {
  @override
  final Iterable<Type> types = const [
    GFetchRecipeListVars,
    _$GFetchRecipeListVars
  ];
  @override
  final String wireName = 'GFetchRecipeListVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GFetchRecipeListVars object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object?>[];
  }

  @override
  GFetchRecipeListVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new GFetchRecipeListVarsBuilder().build();
  }
}

class _$GFetchRecipeListVars extends GFetchRecipeListVars {
  factory _$GFetchRecipeListVars(
          [void Function(GFetchRecipeListVarsBuilder)? updates]) =>
      (new GFetchRecipeListVarsBuilder()..update(updates)).build();

  _$GFetchRecipeListVars._() : super._();

  @override
  GFetchRecipeListVars rebuild(
          void Function(GFetchRecipeListVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GFetchRecipeListVarsBuilder toBuilder() =>
      new GFetchRecipeListVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GFetchRecipeListVars;
  }

  @override
  int get hashCode {
    return 652753331;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('GFetchRecipeListVars').toString();
  }
}

class GFetchRecipeListVarsBuilder
    implements Builder<GFetchRecipeListVars, GFetchRecipeListVarsBuilder> {
  _$GFetchRecipeListVars? _$v;

  GFetchRecipeListVarsBuilder();

  @override
  void replace(GFetchRecipeListVars other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GFetchRecipeListVars;
  }

  @override
  void update(void Function(GFetchRecipeListVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GFetchRecipeListVars build() {
    final _$result = _$v ?? new _$GFetchRecipeListVars._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
