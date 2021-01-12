// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStore, Store {
  final _$vTotalAtom = Atom(name: '_CartStore.vTotal');

  @override
  double get vTotal {
    _$vTotalAtom.reportRead();
    return super.vTotal;
  }

  @override
  set vTotal(double value) {
    _$vTotalAtom.reportWrite(value, super.vTotal, () {
      super.vTotal = value;
    });
  }

  final _$_CartStoreActionController = ActionController(name: '_CartStore');

  @override
  void somar(double value) {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.somar');
    try {
      return super.somar(value);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCount(double value) {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.setCount');
    try {
      return super.setCount(value);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
vTotal: ${vTotal}
    ''';
  }
}
