import 'package:mobx/mobx.dart';
part 'device_store.g.dart';

class DeviceStore = _DeviceStoreBase with _$DeviceStore;

abstract class _DeviceStoreBase with Store {
  double height = 0.0, width = 0.0;

  bool isLocationDenied = false;

  @observable
  bool notification = false;
  @action
  void changeNotification(bool _notification) => notification = _notification;
}
