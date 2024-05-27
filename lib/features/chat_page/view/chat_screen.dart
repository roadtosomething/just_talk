import 'package:flutter/material.dart';
import 'package:just_talk/features/chat_page/widgets/message_list_widget.dart';
import 'package:just_talk/repositories/just_talk/models/chat_model.dart';
import 'package:just_talk/repositories/just_talk/models/message_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  ChatModel? chatModel;

  MessageModel? messageModel;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args is ChatModel, 'You must provide ChatModel args');
    chatModel = args as ChatModel;
    setState(() {});
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Чат эксперта: ${chatModel?.authorName ?? '....'}'),
        ),
        body: MessageListWidget(chatId: chatModel!.id)
    );
  }
}