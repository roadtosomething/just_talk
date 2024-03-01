import 'package:flutter/material.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Помогите',
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.center,
      ),
      leading: const Icon(Icons.ad_units),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
      minVerticalPadding: 30.0,
      tileColor: const Color(0xFFFFd96A),
      onTap: () {
        Navigator.of(context).pushNamed('/help');
      },
    );
  }
}
