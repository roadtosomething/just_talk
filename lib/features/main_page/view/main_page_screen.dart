import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_talk/features/main_page/view/main_menu_view.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Just Talk'),
        leading:
                    TextButton(
                onPressed: ()=>{
              Navigator.of(context).pushNamed('/login')
            },
                child: const Icon(Icons.login)),
        ),
      body: const MainMenuView()
    );
  }
}
