import 'dart:async';

class FTimer {
  Timer _timer;
  bool _started = false;

  bool get started => _started;

  /// 延迟执行
  void startDelayed(Duration duration, void callback()) {
    assert(callback != null);
    cancel();
    _timer = Timer(duration, () {
      cancel();
      callback();
    });
    _started = true;
  }

  /// 间隔执行
  void startPeriodic(Duration duration, void callback(FTimer timer)) {
    assert(callback != null);
    cancel();
    _timer = Timer.periodic(duration, (timer) {
      callback(this);
    });
    _started = true;
  }

  /// 取消定时器
  void cancel() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
    _started = false;
  }
}
