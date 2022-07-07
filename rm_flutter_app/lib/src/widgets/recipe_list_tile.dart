import 'package:ferry/ferry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_it/get_it.dart';
import 'package:rm_flutter_app/src/widgets/recipe_detail_view.dart';
import 'package:rm_graphql_client/rm_graphql_client.dart';

class RecipeListTile extends StatelessWidget {
  const RecipeListTile({Key? key, required this.recipe}) : super(key: key);

  final GFetchRecipeListData_recipes recipe;

  void _removeRecipe(BuildContext context, int recipeId) {
    final client = GetIt.instance<Client>();
    final deleteRecipeReq = GDeleteRecipeReq(
      (b) => b..vars.id = recipeId
    );

    client.request(deleteRecipeReq).listen((response) {
      // Update cache
      final recipesReq = GFetchRecipeListReq();
      final cache = client.cache.readQuery(recipesReq);
      final updateRecipes = GFetchRecipeListData((b) {
        return b..recipes.addAll(cache!.recipes) // TODO: cache!.recipes is correct?
                ..recipes.removeWhere((recipe) => recipe.id == response.data?.delete_recipes_by_pk?.id);
      });
      client.cache.writeQuery(recipesReq, updateRecipes);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            label: 'Delete',
            icon: CupertinoIcons.trash,
            backgroundColor: Colors.blueGrey,
            onPressed: (value) {
              showCupertinoDialog(
                context: context, 
                builder: (context) => CupertinoAlertDialog(
                  title: Text('Delete "${recipe.name}"'),
                  actions: [
                    CupertinoDialogAction(
                      child: const Text('Cancel'),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    CupertinoDialogAction(
                      child: const Text('Delete'),
                      onPressed: () => _removeRecipe(context, recipe.id),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      child: Column(
        children: [
          CupertinoButton(
            onPressed: () {
              showCupertinoModalPopup(
                context: context, 
                builder: (context) => RecipeDetailView(recipe: recipe,),
              );
            },
            child: Row(
              children: [
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(recipe.image_url ?? 'http://placehold.jp/100x100.png'),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.name,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(
                        recipe.description ?? "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey.shade200,
          ),
        ],
      ),
    );
  }
}