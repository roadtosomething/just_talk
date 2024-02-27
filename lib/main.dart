import 'dart:collection';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const JustTalkApp());
}

class JustTalkApp extends StatelessWidget {
  const JustTalkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Just talk',
      theme: ThemeData(
          dividerTheme: const DividerThemeData(
            space: 0,
            color: Color(0xFF4A544A),
          ),
          listTileTheme: const ListTileThemeData(
            tileColor: Color(0x88FFd96A),
            iconColor: Color(0xFF4A544A),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
            backgroundColor: Color(0xCCFFd96A),
          ),
          scaffoldBackgroundColor: Colors.white,
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
                color: Color(0xFF4A544A),
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              labelSmall: TextStyle(
                color: Color(0xAA4A544A),
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ))),
      routes: {
        '/news-list': (context) => NewsListScreen(),
        '/new': (context) => NewsScreen()
      },
      initialRoute: '/news-list',
    );
  }
}

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
            final pageName = "Новость "+ (i+1).toString();
            return ListTile(
                leading: Icon(Icons.message),
                trailing: Icon(Icons.arrow_forward),
                title: Text(
                  pageName,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                subtitle: Text(
                  "Описание новости",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed('/new', arguments: pageName);
                });
          }),
    );
  }
}

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  String? pageName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(args != null && args is String, 'You must provide String args');
    pageName = args as String;
    setState(() {});
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageName ?? '....'),
      ),
    );
  }
}
