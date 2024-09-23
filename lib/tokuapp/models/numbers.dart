import 'package:audioplayers/audioplayers.dart';

class Numbers {
  String image;
  String enumber;
  String jpnumber;
  String audio;

  Numbers(
      {required this.image,
      required this.enumber,
      required this.jpnumber,
      required this.audio});

  playAudio(String enumber) {
    // final player = AudioPlayer();
    // player.play(AssetSource(audio));
    final player = AudioPlayer();
    player.play(AssetSource(audio));
  }
}

List<Numbers> numbers = [
  Numbers(
      audio: 'assets/quiz-blind-test-187140.mp3',
      image:
          'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
      enumber: 'one',
      jpnumber: 'ichi'),
  Numbers(
      audio: '',
      image:
          'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
      enumber: 'two',
      jpnumber: 'ichi'),
  Numbers(
      audio: 'assets/quiz-blind-test-187140.mp3',
      image:
          'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
      enumber: 'three',
      jpnumber: 'ichi'),
  Numbers(
      audio: 'assets/quiz-blind-test-187140.mp3',
      image:
          'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
      enumber: 'four',
      jpnumber: 'ichi'),
  Numbers(
      audio: 'assets/quiz-blind-test-187140.mp3',
      image:
          'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
      enumber: 'one',
      jpnumber: 'ichi'),
  Numbers(
      audio: 'assets/quiz-blind-test-187140.mp3',
      image:
          'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
      enumber: 'one',
      jpnumber: 'ichi'),
  Numbers(
      audio: 'assets/quiz-blind-test-187140.mp3',
      image:
          'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
      enumber: 'one',
      jpnumber: 'ichi'),
  Numbers(
      audio: 'assets/quiz-blind-test-187140.mp3',
      image:
          'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
      enumber: 'one',
      jpnumber: 'ichi'),
  Numbers(
      audio: 'assets/quiz-blind-test-187140.mp3',
      image:
          'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
      enumber: 'one',
      jpnumber: 'ichi'),
  Numbers(
      audio: 'assets/quiz-blind-test-187140.mp3',
      image:
          'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
      enumber: 'one',
      jpnumber: 'ichi'),
];
