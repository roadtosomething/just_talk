import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/message_list_provider.dart';

class MessageListWidget extends StatelessWidget {
  final String chatId;

  MessageListWidget({required this.chatId});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(chatId);
    }
    return ChangeNotifierProvider(
      create: (_) => MessageListProvider()..loadMessages(chatId),
      child: Consumer<MessageListProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (provider.messages.isEmpty) {
              return Center(child: Text('Сообщений нет'));
            }

            return ListView.builder(
              reverse: true,
              itemCount: provider.messages.length,
              itemBuilder: (context, index) {
                final message = provider.messages[index];
                return ListTile(
                  title: Text(message.sender),
                  subtitle: Text(message.text),
                  trailing: Text(
                    message.timestamp.toLocal().toString(),
                    style: TextStyle(fontSize: 12),
                  ),
                );
              },
            );
          },
        ),
      );
  }
}