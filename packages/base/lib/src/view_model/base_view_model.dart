import 'package:flutter/foundation.dart';

import 'base_view_model_state.dart';

abstract class BaseViewModel<STATE extends BaseViewModelState>
    extends ChangeNotifier {
  BaseViewModel(STATE initialState) : _state = initialState;

  STATE _state;

  @nonVirtual
  STATE get state => _state;

  @protected
  set state(STATE newState) {
    if (newState == _state) return;

    _state = newState;
    notifyListeners();
  }
}
