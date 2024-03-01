import 'package:flutter/material.dart';

class ChatButton extends StatelessWidget {
  const ChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Чат со случайным человеком',
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
      leading: const Icon(Icons.list_alt_sharp),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
    );
  }
}
