// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MenuStore on _MenuStoreBase, Store {
  final _$menuOpenAtom = Atom(name: '_MenuStoreBase.menuOpen');

  @override
  bool get menuOpen {
    _$menuOpenAtom.reportRead();
    return super.menuOpen;
  }

  @override
  set menuOpen(bool value) {
    _$menuOpenAtom.reportWrite(value, super.menuOpen, () {
      super.menuOpen = value;
    });
  }

  final _$menuClosedAtom = Atom(name: '_MenuStoreBase.menuClosed');

  @override
  bool get menuClosed {
    _$menuClosedAtom.reportRead();
    return super.menuClosed;
  }

  @override
  set menuClosed(bool value) {
    _$menuClosedAtom.reportWrite(value, super.menuClosed, () {
      super.menuClosed = value;
    });
  }

  final _$closedAtom = Atom(name: '_MenuStoreBase.closed');

  @override
  bool get closed {
    _$closedAtom.reportRead();
    return super.closed;
  }

  @override
  set closed(bool value) {
    _$closedAtom.reportWrite(value, super.closed, () {
      super.closed = value;
    });
  }

  final _$selectTypeAtom = Atom(name: '_MenuStoreBase.selectType');

  @override
  String get selectType {
    _$selectTypeAtom.reportRead();
    return super.selectType;
  }

  @override
  set selectType(String value) {
    _$selectTypeAtom.reportWrite(value, super.selectType, () {
      super.selectType = value;
    });
  }

  final _$_MenuStoreBaseActionController =
      ActionController(name: '_MenuStoreBase');

  @override
  void changeMenuOpen(bool boolen) {
    final _$actionInfo = _$_MenuStoreBaseActionController.startAction(
        name: '_MenuStoreBase.changeMenuOpen');
    try {
      return super.changeMenuOpen(boolen);
    } finally {
      _$_MenuStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeMenuClosed(bool boolen) {
    final _$actionInfo = _$_MenuStoreBaseActionController.startAction(
        name: '_MenuStoreBase.changeMenuClosed');
    try {
      return super.changeMenuClosed(boolen);
    } finally {
      _$_MenuStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeClosed(bool boolen) {
    final _$actionInfo = _$_MenuStoreBaseActionController.startAction(
        name: '_MenuStoreBase.changeClosed');
    try {
      return super.changeClosed(boolen);
    } finally {
      _$_MenuStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeType(String type) {
    final _$actionInfo = _$_MenuStoreBaseActionController.startAction(
        name: '_MenuStoreBase.changeType');
    try {
      return super.changeType(type);
    } finally {
      _$_MenuStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
menuOpen: ${menuOpen},
menuClosed: ${menuClosed},
closed: ${closed},
selectType: ${selectType}
    ''';
  }
}
