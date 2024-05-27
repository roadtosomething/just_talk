import 'package:flutter/material.dart';
import 'package:just_talk/repositories/just_talk/models/chat_model.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    super.key,
    required this.chat,
  });

  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.message),
        trailing: const Icon(Icons.arrow_forward),
        title: Text(
          'Комната эксперта: ${chat.authorName}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        subtitle: Text(
          'Создана: ${chat.createdDate.day}.${chat.createdDate.month}.${chat.createdDate.year}',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        onTap: () {
          Navigator.of(context).pushNamed('/chat', arguments: chat);
        }
        );
  }
}