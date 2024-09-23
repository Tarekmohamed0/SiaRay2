import 'package:flutter/material.dart';
import 'package:first_project/tokuapp/models/numbers.dart';
import 'package:audioplayers/audioplayers.dart';

class NumbersCategorry extends StatelessWidget {
  const NumbersCategorry(
      {super.key,
      required this.image,
      required this.enumber,
      required this.jpnumber});
  final String image;
  final String enumber;
  final String jpnumber;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.brown[200]),
                  child: Image.network(
                    image,
                    scale: 2.5,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(jpnumber),
                    Text(enumber),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  final player = AudioPlayer();
                  player.play(AssetSource('assets/quiz-blind-test-187140.mp3'));
                },
                icon: const Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                  size: 30,
                )),
          ),
        ],
      ),
    );
  }
}
