import 'package:creditcard/module/app/core/controllers/either.dart';
import 'package:flutter/material.dart';

abstract class CustomController<E, S> extends ValueNotifier<S> {
  CustomController(super.value);

  bool _wasDisposed = false;
  final ValueNotifier<E?> _error = ValueNotifier(null);
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  bool get wasDisposed => _wasDisposed;

  E? get error => _error.value;
  bool get hasError => _error.value != null;
  void setError(E value) {
    if (!_wasDisposed) {
      _loading.value = false;
      _error.value = value;
      notifyListeners();
    }
  }

  void clearError({bool update = false}) {
    _error.value = null;
    if (update) {
      notifyListeners();
    }
  }

  bool get isLoading => _loading.value;
  void setLoading(bool value) {
    if (!_wasDisposed) {
      _loading.value = value;
      notifyListeners();
    }
  }

  S get state => value;
  void update(S state, {force = false}) {
    if (!_wasDisposed) {
      clearError();
      setLoading(false);
      if (value != state || force) {
        value = state;
        notifyListeners();
      }
    }
  }

  Future<void> execute(
    Future<Either<E, S>> Function() function, {
    force = false,
  }) async {
    clearError();
    setLoading(true);
    await function().then((value) {
      return value.fold((l) => setError(l), (r) => update(r, force: force));
    }).whenComplete(() => setLoading(false));
  }

  @override
  void dispose() {
    try {
      if (_wasDisposed) {
        debugPrint('$runtimeType already disposed');
        return;
      }
      debugPrint('$runtimeType has been disposed');
      _error.dispose();
      _loading.dispose();
      _wasDisposed = true;
    } catch (exception) {
      debugPrint('$runtimeType already disposed');
    }
    super.dispose();
  }
}
