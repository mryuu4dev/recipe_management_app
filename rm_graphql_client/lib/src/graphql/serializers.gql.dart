import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;
import 'package:rm_graphql_client/src/graphql/operations.data.gql.dart'
    show
        GDeleteRecipeData,
        GDeleteRecipeData_delete_recipes_by_pk,
        GDeleteRecipeData_delete_recipes_by_pk_ingredients,
        GFetchRecipeIngredientsData,
        GFetchRecipeIngredientsData_ingredients,
        GFetchRecipeListData,
        GFetchRecipeListData_recipes,
        GInsertRecipeData,
        GInsertRecipeData_insert_recipes_one,
        GInsertRecipeData_insert_recipes_one_ingredients;
import 'package:rm_graphql_client/src/graphql/operations.req.gql.dart'
    show
        GDeleteRecipeReq,
        GFetchRecipeIngredientsReq,
        GFetchRecipeListReq,
        GInsertRecipeReq;
import 'package:rm_graphql_client/src/graphql/operations.var.gql.dart'
    show
        GDeleteRecipeVars,
        GFetchRecipeIngredientsVars,
        GFetchRecipeListVars,
        GInsertRecipeVars;
import 'package:rm_graphql_client/src/graphql/schema.schema.gql.dart'
    show
        GInt_comparison_exp,
        GString_comparison_exp,
        Gingredients_aggregate_order_by,
        Gingredients_arr_rel_insert_input,
        Gingredients_avg_order_by,
        Gingredients_bool_exp,
        Gingredients_constraint,
        Gingredients_inc_input,
        Gingredients_insert_input,
        Gingredients_max_order_by,
        Gingredients_min_order_by,
        Gingredients_on_conflict,
        Gingredients_order_by,
        Gingredients_pk_columns_input,
        Gingredients_select_column,
        Gingredients_set_input,
        Gingredients_stddev_order_by,
        Gingredients_stddev_pop_order_by,
        Gingredients_stddev_samp_order_by,
        Gingredients_sum_order_by,
        Gingredients_update_column,
        Gingredients_var_pop_order_by,
        Gingredients_var_samp_order_by,
        Gingredients_variance_order_by,
        Gorder_by,
        Grecipes_bool_exp,
        Grecipes_constraint,
        Grecipes_inc_input,
        Grecipes_insert_input,
        Grecipes_obj_rel_insert_input,
        Grecipes_on_conflict,
        Grecipes_order_by,
        Grecipes_pk_columns_input,
        Grecipes_select_column,
        Grecipes_set_input,
        Grecipes_update_column;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GDeleteRecipeData,
  GDeleteRecipeData_delete_recipes_by_pk,
  GDeleteRecipeData_delete_recipes_by_pk_ingredients,
  GDeleteRecipeReq,
  GDeleteRecipeVars,
  GFetchRecipeIngredientsData,
  GFetchRecipeIngredientsData_ingredients,
  GFetchRecipeIngredientsReq,
  GFetchRecipeIngredientsVars,
  GFetchRecipeListData,
  GFetchRecipeListData_recipes,
  GFetchRecipeListReq,
  GFetchRecipeListVars,
  GInsertRecipeData,
  GInsertRecipeData_insert_recipes_one,
  GInsertRecipeData_insert_recipes_one_ingredients,
  GInsertRecipeReq,
  GInsertRecipeVars,
  GInt_comparison_exp,
  GString_comparison_exp,
  Gingredients_aggregate_order_by,
  Gingredients_arr_rel_insert_input,
  Gingredients_avg_order_by,
  Gingredients_bool_exp,
  Gingredients_constraint,
  Gingredients_inc_input,
  Gingredients_insert_input,
  Gingredients_max_order_by,
  Gingredients_min_order_by,
  Gingredients_on_conflict,
  Gingredients_order_by,
  Gingredients_pk_columns_input,
  Gingredients_select_column,
  Gingredients_set_input,
  Gingredients_stddev_order_by,
  Gingredients_stddev_pop_order_by,
  Gingredients_stddev_samp_order_by,
  Gingredients_sum_order_by,
  Gingredients_update_column,
  Gingredients_var_pop_order_by,
  Gingredients_var_samp_order_by,
  Gingredients_variance_order_by,
  Gorder_by,
  Grecipes_bool_exp,
  Grecipes_constraint,
  Grecipes_inc_input,
  Grecipes_insert_input,
  Grecipes_obj_rel_insert_input,
  Grecipes_on_conflict,
  Grecipes_order_by,
  Grecipes_pk_columns_input,
  Grecipes_select_column,
  Grecipes_set_input,
  Grecipes_update_column
])
final Serializers serializers = _serializersBuilder.build();
