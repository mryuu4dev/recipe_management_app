// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:rm_graphql_client/src/graphql/operations.ast.gql.dart' as _i5;
import 'package:rm_graphql_client/src/graphql/operations.data.gql.dart' as _i2;
import 'package:rm_graphql_client/src/graphql/operations.var.gql.dart' as _i3;
import 'package:rm_graphql_client/src/graphql/serializers.gql.dart' as _i6;

part 'operations.req.gql.g.dart';

abstract class GFetchRecipeListReq
    implements
        Built<GFetchRecipeListReq, GFetchRecipeListReqBuilder>,
        _i1.OperationRequest<_i2.GFetchRecipeListData,
            _i3.GFetchRecipeListVars> {
  GFetchRecipeListReq._();

  factory GFetchRecipeListReq(
      [Function(GFetchRecipeListReqBuilder b) updates]) = _$GFetchRecipeListReq;

  static void _initializeBuilder(GFetchRecipeListReqBuilder b) => b
    ..operation =
        _i4.Operation(document: _i5.document, operationName: 'FetchRecipeList')
    ..executeOnListen = true;
  _i3.GFetchRecipeListVars get vars;
  _i4.Operation get operation;
  _i4.Request get execRequest =>
      _i4.Request(operation: operation, variables: vars.toJson());
  String? get requestId;
  @BuiltValueField(serialize: false)
  _i2.GFetchRecipeListData? Function(
      _i2.GFetchRecipeListData?, _i2.GFetchRecipeListData?)? get updateResult;
  _i2.GFetchRecipeListData? get optimisticResponse;
  String? get updateCacheHandlerKey;
  Map<String, dynamic>? get updateCacheHandlerContext;
  _i1.FetchPolicy? get fetchPolicy;
  bool get executeOnListen;
  @override
  _i2.GFetchRecipeListData? parseData(Map<String, dynamic> json) =>
      _i2.GFetchRecipeListData.fromJson(json);
  static Serializer<GFetchRecipeListReq> get serializer =>
      _$gFetchRecipeListReqSerializer;
  Map<String, dynamic> toJson() =>
      (_i6.serializers.serializeWith(GFetchRecipeListReq.serializer, this)
          as Map<String, dynamic>);
  static GFetchRecipeListReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(GFetchRecipeListReq.serializer, json);
}
