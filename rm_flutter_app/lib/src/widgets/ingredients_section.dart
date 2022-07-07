import 'package:flutter/cupertino.dart';

class IngredientsSection extends StatefulWidget {
  const IngredientsSection({Key? key}) : super(key: key);

  @override
  State<IngredientsSection> createState() => _IngredientsSectionState();
}

class _IngredientsSectionState extends State<IngredientsSection> {
  final fields = [];

  void _addField() {
    fields.add('');
    setState(() {});
  }

  void _removeField(int index) {
    fields.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Add ingredients',
          style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
        ),
        const SizedBox(height: 15,),
        for (int i = 0; i < fields.length; i++)
          Row(
            children: [
              const Expanded(
                child: CupertinoTextField(
                  padding: EdgeInsets.all(18),
                ),
              ),
              CupertinoButton(
                onPressed: () => _removeField(i),
                child: const Icon(CupertinoIcons.minus_circle),
              ),
            ],
          ),
        CupertinoButton(
          onPressed: () => _addField(),
          child: const Text('+ Add field',),
        ),
      ],
    );
  }
}