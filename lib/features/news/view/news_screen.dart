import 'package:flutter/material.dart';
import 'package:just_talk/repositories/just_talk/models/news_model.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  NewsModel? newsModel;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args is NewsModel, 'You must provide NewsModel args');
    newsModel = args as NewsModel;
    setState(() {});
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(newsModel?.title ?? '....'),
        ),
        body: ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(40),
              child: Text(newsModel?.description ?? 'Разработчик не добавил описание... Жаль, нам же так интересно, чем он занят',
                  style: Theme.of(context).textTheme.bodyMedium)
              ),
              Container(
                padding: const EdgeInsets.only(right: 15),
                child:Column(
                    children: [
                      Text('Дата: ${newsModel?.date ?? 'Не указана'}',
                        style: Theme.of(context).textTheme.labelSmall,),
                      Text('Автор: ${newsModel?.author ?? 'Не указан'}',
                          style: Theme.of(context).textTheme.labelSmall)
                    ],
                ),
              )
            ],
        )
    );
  }
}