import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_flutter/Data/count_data.dart';
import 'package:udemy_flutter/logic/button_animation_logic.dart';
import 'package:udemy_flutter/logic/count_data_changed_notifier.dart';
import 'package:udemy_flutter/logic/logic.dart';
import 'package:udemy_flutter/logic/sound_logic.dart';
import 'package:udemy_flutter/provider.dart';

class ViewModel {
  final Logic _logic = Logic();

  final SoundLogic _soundLogic = SoundLogic();
  late ButtonAnimationLogic _buttonAnimationLogicPlus;
  late WidgetRef _ref;

  List<CountDataChangedNotifier> notifiers = [];

  void setRef(WidgetRef ref, TickerProvider tickerProvider) {
_ref = ref;
_buttonAnimationLogicPlus = ButtonAnimationLogic(tickerProvider);
_soundLogic.load();

  }
  get count => _ref.watch(countDataProvider.notifier).state.count.toString();
  get countUp => _ref
      .watch(countDataProvider.notifier.select((value) => value.state.countUp))
      .toString();
  get countDown => _ref
      .watch(countDataProvider.notifier.select((value) => value.state.countDown))
      .toString();

  get animationPlus => _buttonAnimationLogicPlus.animationScale;

  void onIncrease() {
    _logic.increase();
    update();
  }

  void onDecrease() {
    _logic.decrease();
    update();
  }

  void onReset() {
    _logic.reset();
    update();
  }

  void update() {
    CountData oldValue = _ref.watch(countDataProvider.notifier).state;
    _ref.watch(countDataProvider.notifier).state = _logic.countData;
    CountData newValue = _ref.watch(countDataProvider.notifier).state;
    _soundLogic.playUpSound();
    _soundLogic.valueChanged(oldValue, newValue);

    _buttonAnimationLogicPlus.valueChanged(oldValue, newValue);
  }
}