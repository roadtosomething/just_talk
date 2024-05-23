import 'package:flutter/material.dart';

class ChatButton extends StatelessWidget {
  const ChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
    child: OutlinedButton(
      onPressed: ()=>{
        Navigator.of(context).pushNamed('/chat')
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0)
        ),
        side: const BorderSide(
          width: 0.4,
          color: Color(0xFF121212)
        )
      ),
      child: ListTile(
        title: Text(
          'Чат',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        leading: const Icon(Icons.chat),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
        iconColor: Color(0xFF121212),
      ),
    ),
    );
  }
}
