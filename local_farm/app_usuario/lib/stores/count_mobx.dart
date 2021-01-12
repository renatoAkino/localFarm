import 'package:mobx/mobx.dart';

part 'count_mobx.g.dart';

class ItemCounterStore = _ItemCounterStore with _$ItemCounterStore;

abstract class _ItemCounterStore with Store {
  _ItemCounterStore() {
    autorun((_) {
      print(count);
    });
  }

  @observable
  int count = 1;

  @action
  void increment() {
    count++;
  }

  @action
  void decrement() {
    if (count > 1) {
      count--;
    }
  }

  @action
  void setCount(int value) => count = value;
}
