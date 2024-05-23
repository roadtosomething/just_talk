import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'package:just_talk/repositories/just_talk/models/tip_model.dart';

class MainMenuView extends StatelessWidget {

  const MainMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
      children: const [
        TipWidget(),
        HelpButton(),
        ChatButton()],
    );
  }
}
