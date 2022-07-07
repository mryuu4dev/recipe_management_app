import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class IngredientsSection extends StatefulWidget {
  const IngredientsSection({Key? key, required this.onUpdate}) : super(key: key);

  final ValueChanged<List<Map<String, String>>> onUpdate;
  final Uuid uuid = const Uuid();

  @override
  State<IngredientsSection> createState() => _IngredientsSectionState();
}

class _IngredientsSectionState extends State<IngredientsSection> {
  final List<Map<String, String>> fields = [];

  void _addField() {
    fields.add({widget.uuid.v1(): ''});
    setState(() {
      print(fields);
    });
  }

  void _updateField(String value, int index) {
    final key = fields[index].keys.first;
    fields[index][key] = value;
    widget.onUpdate(fields);
  }

  void _removeField(int index) {
    fields.removeAt(index);
    widget.onUpdate(fields);
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
            key: ValueKey(fields[i].keys.first,),
            children: [
              Expanded(
                child: CupertinoTextField(
                  padding: const EdgeInsets.all(18),
                  onChanged: (value) => _updateField(value, i),
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