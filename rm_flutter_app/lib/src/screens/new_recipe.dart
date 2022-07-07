import 'package:ferry/ferry.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:rm_flutter_app/src/form_values.dart';
import 'package:rm_flutter_app/src/widgets/recipe_form.dart';
import 'package:rm_graphql_client/rm_graphql_client.dart';

class NewRecipeScreen extends StatelessWidget {
  const NewRecipeScreen({Key? key}) : super(key: key);

  void _addRecipe(BuildContext context, FormValues values) {
    final client = GetIt.instance<Client>();
    final addRecipeReq = GInsertRecipeReq((b) => 
      b..vars.object.name = values.name
       ..vars.object.description = values.description
       ..vars.object.image_url = values.imageUrl
    );

    client.request(addRecipeReq).listen((response) {
      // Update cache
      final recipesReq = GFetchRecipeListReq();
      final cache = client.cache.readQuery(recipesReq);
      final updateRecipes = GFetchRecipeListData((b) {
        return b..recipes.addAll(cache!.recipes) // TODO: cache!.recipes is correct?
                ..recipes.add(GFetchRecipeListData_recipes.fromJson(
                  response.data!.insert_recipes_one!.toJson(), // TODO: perform null checks as appropriate
                )!); // TODO: perform null checks as appropriate
      });
      client.cache.writeQuery(recipesReq, updateRecipes);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Add recipe')
      ),
      child: CustomScrollView(
        slivers: [
          SliverSafeArea(
            minimum: const EdgeInsets.all(15),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                RecipeForm(
                  onSubmit: (values) => _addRecipe(context, values),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}