import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rm_graphql_client/rm_graphql_client.dart';

class RecipeDetailView extends StatelessWidget {
  RecipeDetailView({Key? key, required this.recipe,}) 
    : ingredientsReq = GFetchRecipeIngredientsReq((b) {
      return b..vars.where.recipe_id.G_eq = recipe.id;
    }),
    super(key: key);

  final GFetchRecipeListData_recipes recipe;
  final GFetchRecipeIngredientsReq ingredientsReq;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height * .9,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20,),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40,),
                    Text(
                      recipe.name,
                      style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.network(
                        recipe.image_url ?? 'http://placehold.jp/500x500.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Text(
                      recipe.description ?? "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                      style: const TextStyle(fontSize: 20,),
                    ),
                    const SizedBox(height: 20,),
                    Text(
                      'Ingredients',
                      style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(fontSize: 25,),
                    ),
                    const SizedBox(height: 15,),
                    Operation(
                      operationRequest: ingredientsReq, 
                      builder: (context, OperationResponse<GFetchRecipeIngredientsData, GFetchRecipeIngredientsVars>? response, Object? object) {
                        if (response == null) {
                          throw Exception('response object is null');
                        }
                        if (response.loading) {
                          return const Center(child: CircularProgressIndicator(),);
                        }

                        final ingredients = response.data?.ingredients;

                        if (ingredients == null) {
                          throw Exception('ingredients object is null');
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var ingredient in ingredients)
                              ...[Text(ingredient.name), const SizedBox(height: 10,),],
                          ],
                        );
                      }, 
                      client: GetIt.instance<Client>(),
                    ),
                    const SizedBox(height: 40,),
                    Center(
                      child: CupertinoButton(
                        onPressed: () => Navigator.pop(context),
                        color: Colors.blue,
                        child: const Text('Go back'),
                      ),
                    ),
                    const SizedBox(height: 40,),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}