import 'package:flutter/material.dart';
import 'package:just_talk/repositories/just_talk/chats_list_repository.dart';

import '../../../repositories/just_talk/models/chat_model.dart';
import '../widgets/widgets.dart';

class ChatsListScreen extends StatefulWidget {
  const ChatsListScreen({super.key});

  @override
  State<ChatsListScreen> createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatsListScreen> {

  List<ChatModel>? _chatsModelList;

  @override
  void initState() {
    _newsListLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Список чатов"),
      ),
      body: (_chatsModelList == null) ?
      const SizedBox() :
      ListView.separated(
          itemCount: _chatsModelList!.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, i) {
            final chat = _chatsModelList![i];
            return ChatListTile(chat: chat);
          }
          ),
      //floatingActionButton: FloatingActionButton(
        //child: const Icon(Icons.add),
        //onPressed: () async {
          //await _newsListLoad();
        //},
      //),
    );
  }
  Future<void> _newsListLoad () async {
    _chatsModelList = await ChatListRepository().getChatsList();
    setState((){});
  }
}


