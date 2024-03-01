import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class CallButton extends StatefulWidget {
  const CallButton({super.key});

  @override
  State<CallButton> createState() => _CallButtonState();
}

class _CallButtonState extends State<CallButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _dialNumber("123123123");
        },
        child: Text(
            'Позвонить',
          style: Theme.of(context).textTheme.bodyMedium,
        )
    );
  }


  Future<void> _dialNumber(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
