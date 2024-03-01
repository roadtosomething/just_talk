import 'package:flutter/material.dart';

class NewsButton extends StatelessWidget {
  const NewsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Новости',
        style: Theme.of(context).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
      leading: const Icon(Icons.list_alt_sharp),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
      onTap:() {
        Navigator.of(context).pushNamed('/news-list');
      },
    );
  }
}
