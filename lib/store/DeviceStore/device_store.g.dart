// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DeviceStore on _DeviceStoreBase, Store {
  final _$notificationAtom = Atom(name: '_DeviceStoreBase.notification');

  @override
  bool get notification {
    _$notificationAtom.reportRead();
    return super.notification;
  }

  @override
  set notification(bool value) {
    _$notificationAtom.reportWrite(value, super.notification, () {
      super.notification = value;
    });
  }

  final _$_DeviceStoreBaseActionController =
      ActionController(name: '_DeviceStoreBase');

  @override
  void changeNotification(bool _notification) {
    final _$actionInfo = _$_DeviceStoreBaseActionController.startAction(
        name: '_DeviceStoreBase.changeNotification');
    try {
      return super.changeNotification(_notification);
    } finally {
      _$_DeviceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notification: ${notification}
    ''';
  }
}
