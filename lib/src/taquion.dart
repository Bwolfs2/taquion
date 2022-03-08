class Taquion {
  static final Map<Type, Object> _injected = {};

  static T take<T>(Function() data) {
    var _data = _injected[T];

    if (_data != null) {
      return _data as T;
    }

    var tempData = data();
    _injected[T] = tempData;

    return tempData as T;
  }
}
