import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  // _CartStore() {
  //   autorun((_) {
  //     print(vTotal);
  //   });
  // }

  @observable
  double vTotal = 0.0;

  @action
  void somar(double value) {
    vTotal += value;
  }

  // @action
  // void decrement() {
  //   if (count > 1) {
  //     count--;
  //   }
  // }

  @action
  void setCount(double value) => vTotal = value;
}
