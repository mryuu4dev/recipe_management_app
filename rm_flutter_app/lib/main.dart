import 'package:ferry/ferry.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:rm_flutter_app/src/screens/all_recipes.dart';
import 'package:rm_flutter_app/src/screens/new_recipe.dart';
import 'package:rm_graphql_client/rm_graphql_client.dart';

void main() {
  GetIt.instance.registerSingleton<Client>(
    initClient('http://10.207.171.45:8081/v1/graphql')
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (_) => AllRecipesScreen(),
        '/new': (_) => const NewRecipeScreen(),
      },
    );
  }
}
