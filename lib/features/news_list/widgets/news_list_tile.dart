import 'package:flutter/material.dart';

class NewsListTile extends StatelessWidget {
  const NewsListTile({
    super.key,
    required this.pageName,
  });

  final String pageName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.message),
        trailing: const Icon(Icons.arrow_forward),
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
  }
}