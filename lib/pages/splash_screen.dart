import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mf_part1_lagu_daerah/pages/home_pages.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Center(
                child: Text(
              'Kumpulan Lagu Daerah Indonesia',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            )),
            Center(
              child: Lottie.network(
                  'https://lottie.host/33f1014c-6f32-4dd6-a84e-8149a2c068bd/no6ulMZVFg.json'),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SlideAction(
                  borderRadius: 12,
                  elevation: 0,
                  innerColor: Colors.deepPurple,
                  outerColor: Colors.deepPurple[200],
                  sliderButtonIcon: const Icon(
                    Icons.music_note_outlined,
                    color: Colors.white,
                  ),
                  text: 'Geser di sini',
                  textStyle: const TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                  submittedIcon: const Icon(
                    Icons.music_note_outlined,
                    color: Colors.white,
                  ),
                  onSubmit: () {
                    //do something
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const HomePages();
                      },
                    ));
                    return null;
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
