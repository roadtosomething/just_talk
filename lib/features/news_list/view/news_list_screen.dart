import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("News"),
      ),
      body: ListView.separated(
          itemCount: 20,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, i) {
            final pageName = "Новость ${i+1}";
            return NewsListTile(pageName: pageName);
          }),
    );
  }
}

