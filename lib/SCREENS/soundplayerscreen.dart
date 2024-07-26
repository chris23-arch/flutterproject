import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SoundPlayerScreen(),
    );
  }
}

class SoundPlayerScreen extends StatefulWidget {
  @override
  _SoundPlayerScreenState createState() => _SoundPlayerScreenState();
}

class _SoundPlayerScreenState extends State<SoundPlayerScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> _playSound() async {
    await _audioPlayer.play(AssetSource('sound/player.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sound Player'),
      ),
      body: Center(
        child: Image.asset(
          'assets/images/jesus_christ_ image.jpg'
        ),
      ),
    );
  }
}
