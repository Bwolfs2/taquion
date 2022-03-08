class Taquion {
  static final Map<Type, Object> _injected = {};

  static void dispose<T>({type}) {
    Object? _data;
    if (type != null) {
      _data = _injected[type];
    } else {
      _data = _injected[T];
    }

    if (_data != null) {
      _injected.remove(type);
    }
  }

  static T take<T>(Function() data, {bool refresh = false}) {
    var _data = _injected[T];

    if (_data != null && !refresh) {
      return _data as T;
    }

    var tempData = data();
    _injected[tempData.runtimeType] = tempData;

    return tempData as T;
  }
}

extension Ext on Object {
  // T take<T>({bool refresh = false}) {
  //   return Taquion.take(() => this, refresh: refresh);
  // }

  void dispose() {
    Taquion.dispose(type: runtimeType);
  }
}
