import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoRecipes extends StatelessWidget {
  const NoRecipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100,),
        const Icon(
          CupertinoIcons.square_stack_3d_down_right,
          color: Colors.black12,
          size: 50,
        ),
        const SizedBox(height: 10,),
        const Text(
          'No recipes to view',
          style: TextStyle(color: Colors.grey,),
        ),
        CupertinoButton(
          onPressed: () {
            Navigator.pushNamed(context, '/new');
          },
          child: const Text('+ Add your first'),
        ),
      ],
    );
  }
}