import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rm_flutter_app/src/form_values.dart';
import 'package:rm_flutter_app/src/widgets/ingredients_section.dart';

class RecipeForm extends StatefulWidget {
  const RecipeForm({Key? key, required this.onSubmit}) : super(key: key);

  final ValueChanged<FormValues> onSubmit;

  @override
  State<RecipeForm> createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {
  final values = FormValues();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoTextField(
          placeholder: 'Name',
          padding: const EdgeInsets.all(18),
          onChanged: (value) {
            values.name = value;
          },
        ),
        const SizedBox(height: 10,),
        CupertinoTextField(
          placeholder: 'Description',
          maxLines: 7,
          padding: const EdgeInsets.all(18),
          onChanged: (value) {
            values.description = value;
          },
        ),
        const SizedBox(height: 10,),
        CupertinoTextField(
          placeholder: 'Image url',
          padding: const EdgeInsets.all(18),
          onChanged: (value) {
            values.imageUrl = value;
          },
        ),
        const SizedBox(height: 30,),
        IngredientsSection(
          onUpdate: (value) => values.ingredients = value,
        ),
        const SizedBox(height: 40,),
        CupertinoButton(
          onPressed: () {
            widget.onSubmit(values);
          },
          color: Colors.blue,
          child: const Text('Add recipe'),
        ),
        const SizedBox(height: 40,),
      ],
    );
  }
}
