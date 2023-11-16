import 'package:audioplayers/audioplayers.dart';
import 'package:udemy_flutter/Data/count_data.dart';

class SoundLogic {
  static const SOUND_DATA_UP = 'assets/sounds/anata wo siritakute.mp3';

  final AudioCache _cache = AudioCache();

  void load() {
    _cache.loadAll([SOUND_DATA_UP]);
  }

  void valueChanged(CountData oldValue, CountData newValue) {
    if (newValue.countUp == 0 && newValue.countDown ==0) {
      playResetSound();
    } else if (oldValue.countUp + 1 == newValue.countUp) {
      playUpSound();
    } else if (oldValue.countDown + 1 == newValue.countDown) {
      playDownSound();
    }
  }

  void playUpSound() {
    // _cache.play(SOUND_DATA_UP);
  }

  void playDownSound() {
    // _cache.play(SOUND_DATA_UP);
  }

  void playResetSound() {
    // _cache.play(SOUND_DATA_UP);
  }
}