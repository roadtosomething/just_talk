import 'package:flutter/material.dart';
import 'package:just_talk/repositories/just_talk/models/news_model.dart';

class NewsListTile extends StatelessWidget {
  const NewsListTile({
    super.key,
    required this.news,
  });

  final NewsModel news;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.message),
        trailing: const Icon(Icons.arrow_forward),
        title: Text(
          news.title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        subtitle: Text(
          news.description,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        onTap: () {
          Navigator.of(context).pushNamed('/new', arguments: news);
        });
  }
}