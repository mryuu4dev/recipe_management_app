// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:rm_graphql_client/src/graphql/serializers.gql.dart' as _i1;

part 'operations.var.gql.g.dart';

abstract class GFetchRecipeListVars
    implements Built<GFetchRecipeListVars, GFetchRecipeListVarsBuilder> {
  GFetchRecipeListVars._();

  factory GFetchRecipeListVars(
          [Function(GFetchRecipeListVarsBuilder b) updates]) =
      _$GFetchRecipeListVars;

  static Serializer<GFetchRecipeListVars> get serializer =>
      _$gFetchRecipeListVarsSerializer;
  Map<String, dynamic> toJson() =>
      (_i1.serializers.serializeWith(GFetchRecipeListVars.serializer, this)
          as Map<String, dynamic>);
  static GFetchRecipeListVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(GFetchRecipeListVars.serializer, json);
}
