// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:mf_part1_lagu_daerah/models/province.dart';

class MusicPage extends StatefulWidget {
  final Province province;
  const MusicPage({
    Key? key,
    required this.province,
  }) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final AudioPlayer audioPlayer = AudioPlayer();
  Duration _duration = Duration();
  Duration _position = Duration();
  bool isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // duration music
    audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _duration = duration;
      });
    });

    // position music
    audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        _position = position;
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  void playPause() {
    if (isPlaying) {
      audioPlayer.pause();
    } else {
      audioPlayer.play(AssetSource(widget.province.audio));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void stop() {
    audioPlayer.stop();
    setState(() {
      isPlaying = false;
      _position = Duration();
    });
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Simple MP3 Player'),
      // ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text(
              //   'Now Playing',
              //   style: TextStyle(fontSize: 24),
              // ),
              const SizedBox(
                height: 24,
              ),
              Text(
                '${formatDuration(_position)} / ${formatDuration(_duration)}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Slider(
                value: _position.inSeconds.toDouble(),
                max: _duration.inSeconds.toDouble(),
                onChanged: (value) {
                  audioPlayer.seek(Duration(seconds: value.toInt()));
                },
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    iconSize: 54,
                    onPressed: playPause,
                  ),
                  IconButton(
                    icon: Icon(Icons.stop),
                    iconSize: 54,
                    onPressed: stop,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
