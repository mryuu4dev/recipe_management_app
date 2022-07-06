import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rm_graphql_client/rm_graphql_client.dart';

class RecipeDetailView extends StatelessWidget {
  const RecipeDetailView({Key? key, required this.recipe,}) : super(key: key);

  final GFetchRecipeListData_recipes recipe;

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
                    const SizedBox(height: 40,),
                    Center(
                      child: CupertinoButton(
                        onPressed: () => Navigator.pop(context),
                        color: Colors.blue,
                        child: const Text('Go back'),
                      ),
                    ),
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