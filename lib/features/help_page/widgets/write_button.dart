import 'package:flutter/material.dart';

class WriteButton extends StatelessWidget {
  const WriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: Text(
          'Написать',
          style: Theme.of(context).textTheme.bodyMedium,
        )
    );;
  }
}
