import 'package:ferry/ferry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:rm_flutter_app/src/screens/all_recipes.dart';
import 'package:rm_flutter_app/src/screens/new_recipe.dart';
import 'package:rm_graphql_client/rm_graphql_client.dart';

void main() async {
  await dotenv.load(fileName: '.env');

  GetIt.instance.registerSingleton<Client>(
    initClient(
      '${dotenv.env['HASURA_GRAPHQL_ENDPOINT']}/v1/graphql', 
      dotenv.env['HASURA_GRAPHQL_ADMIN_SECRET']!,
    )
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
