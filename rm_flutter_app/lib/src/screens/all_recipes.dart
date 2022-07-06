import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rm_flutter_app/src/widgets/no_recipes.dart';
import 'package:rm_flutter_app/src/widgets/recipe_list_tile.dart';
import 'package:rm_graphql_client/rm_graphql_client.dart';

class AllRecipesScreen extends StatelessWidget {
  AllRecipesScreen({Key? key}) : super(key: key);

  final recipesReq = GFetchRecipeListReq();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: const Text('All Recipes'),
            trailing: CupertinoButton(
              padding: const EdgeInsets.all(5),
              onPressed: () {
                Navigator.pushNamed(context, '/new');
              },
              child: const Icon(
                CupertinoIcons.plus_rectangle_fill,
                size: 30,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Operation(
                operationRequest: recipesReq, 
                builder: (context, OperationResponse<GFetchRecipeListData, GFetchRecipeListVars>? response, Object? object) {
                  if (response == null) {
                    throw Exception('response object is null');
                  }
                  if (response.loading) {
                    return const Center(child: CircularProgressIndicator(),);
                  }

                  final recipes = response.data?.recipes;

                  if (recipes == null) {
                    throw Exception('recipes object is null');
                  }
                  if (recipes.isEmpty) {
                    return const NoRecipes();
                  }

                  return Column(
                    children: [
                      for (int i = 0; i < recipes.length; i++)
                        RecipeListTile(recipe: recipes[i],),
                    ],
                  );
                }, 
                client: GetIt.instance<Client>(),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}