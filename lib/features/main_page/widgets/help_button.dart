import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpButton extends StatelessWidget {
  const HelpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () {
      _dialNumber("123123123");
    },
    style:  TextButton.styleFrom(
    backgroundColor: Theme.of(context).colorScheme.error
    ),
    child: ListTile(
    title: Text(
    'Срочный вызов',
    style: Theme.of(context).textTheme.labelLarge,
    textAlign: TextAlign.center,
    ),
    leading: const Icon(Icons.ad_units),
    trailing: const Icon(Icons.arrow_forward_ios_outlined),
    iconColor: Theme.of(context).textTheme.labelLarge?.color,
    minVerticalPadding: 30.0,
    )
    ),)
      ;
  }

  Future<void> _dialNumber(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
