import 'package:mobx/mobx.dart';
part 'menu_store.g.dart';

class MenuStore = _MenuStoreBase with _$MenuStore;

abstract class _MenuStoreBase with Store {
  @observable
  bool menuOpen = false;

  @action
  void changeMenuOpen(bool boolen) => menuOpen = boolen;

  @observable
  bool menuClosed = false;

  @action
  void changeMenuClosed(bool boolen) => menuClosed = boolen;

  @observable
  bool closed = false;

  @action
  void changeClosed(bool boolen) => closed = boolen;
}
