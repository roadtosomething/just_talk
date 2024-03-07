import 'package:flutter/material.dart';
import 'package:just_talk/repositories/just_talk/news_list_repository.dart';

import '../../../repositories/just_talk/models/news_model.dart';
import '../widgets/widgets.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {

  List<NewsModel>? _newsModelList;

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
        title: const Text("Новости от разработчков"),
      ),
      body: (_newsModelList == null) ?
      const SizedBox() :
      ListView.separated(
          itemCount: _newsModelList!.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, i) {
            final news = _newsModelList![i];
            return NewsListTile(news: news);
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.download),
        onPressed: () async {
          await _newsListLoad();
        },
      ),
    );
  }
  Future<void> _newsListLoad () async {
    _newsModelList = await NewsListRepository().getNewsList();
    setState((){});
  }
}


