import 'package:flutter/material.dart';
import 'package:just_talk/services/tip_repository.dart';

class TipWidget extends StatelessWidget {

  const TipWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final tipRepository = TipService();
    return Padding(
        padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Совет от виртуального помощника",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            FutureBuilder(
                future: tipRepository.getTips(),
                builder: (context,snapshot){
                  if (snapshot.connectionState==ConnectionState.waiting){
                    return const Center(child: CircularProgressIndicator());
                  }
                  else {
                    return Text(
                        snapshot.data!.text
                    );
                  }
                }),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}",
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
