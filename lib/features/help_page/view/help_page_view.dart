import 'package:flutter/cupertino.dart';
import 'package:just_talk/features/help_page/widgets/widgets.dart';

class HelpPageView extends StatelessWidget {
  const HelpPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [CallButton(), WriteButton()],
    );
  }
}
