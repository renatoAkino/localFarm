// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'count_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemCounterStore on _ItemCounterStore, Store {
  final _$countAtom = Atom(name: '_ItemCounterStore.count');

  @override
  int get count {
    _$countAtom.reportRead();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.reportWrite(value, super.count, () {
      super.count = value;
    });
  }

  final _$_ItemCounterStoreActionController =
      ActionController(name: '_ItemCounterStore');

  @override
  void increment() {
    final _$actionInfo = _$_ItemCounterStoreActionController.startAction(
        name: '_ItemCounterStore.increment');
    try {
      return super.increment();
    } finally {
      _$_ItemCounterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_ItemCounterStoreActionController.startAction(
        name: '_ItemCounterStore.decrement');
    try {
      return super.decrement();
    } finally {
      _$_ItemCounterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCount(int value) {
    final _$actionInfo = _$_ItemCounterStoreActionController.startAction(
        name: '_ItemCounterStore.setCount');
    try {
      return super.setCount(value);
    } finally {
      _$_ItemCounterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
count: ${count}
    ''';
  }
}
