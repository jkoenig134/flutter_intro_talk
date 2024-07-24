import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle("Flutter Intro");
    setWindowMinSize(const Size(1200, 800));
  }

  runApp(const FlutterDeckExample());
}

class FlutterDeckExample extends StatelessWidget {
  const FlutterDeckExample({super.key});

  @override
  Widget build(BuildContext context) {
    // This is an entry point for the Flutter Deck app.
    return FlutterDeckApp(
      configuration: const FlutterDeckConfiguration(
        footer: FlutterDeckFooterConfiguration(
          showFooter: true,
          showSocialHandle: true,
          showSlideNumbers: true,
        ),
        transition: FlutterDeckTransition.fade(),
      ),
      speakerInfo: const FlutterDeckSpeakerInfo(
        name: 'Julian König',
        description: 'Docker Captain'
            ' | Flutter Entusiast | Full-Stack @ js-soft in Heidelberg',
        socialHandle: '@jkoenig134',
        imagePath: 'assets/me.png',
      ),
      slides: const [
        TitleSlide(),
      ],
    );
  }
}

class TitleSlide extends FlutterDeckSlideWidget {
  const TitleSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/title-slide',
            title: 'Title slide',
            footer: FlutterDeckFooterConfiguration(showFooter: false),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.title(
      title: 'Flutter Intro',
      subtitle: 'Flutter von A bis C',
    );
  }
}

