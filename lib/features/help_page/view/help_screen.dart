import 'package:flutter/material.dart';
import 'package:just_talk/features/help_page/view/help_page_view.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
              'Помощь'
          ),
        ),
        body: const HelpPageView()
    );
  }
}
