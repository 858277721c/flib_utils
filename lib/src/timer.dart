import 'dart:async';

class FTimer {
  Timer _timer;

  bool get isActive => _timer != null && _timer.isActive;

  /// 延迟执行
  void startDelayed(Duration duration, void callback()) {
    assert(callback != null);
    cancel();
    _timer = Timer(duration, () {
      cancel();
      callback();
    });
  }

  /// 间隔执行
  void startPeriodic(Duration duration, void callback(FTimer timer)) {
    assert(callback != null);
    cancel();
    _timer = Timer.periodic(duration, (timer) {
      callback(this);
    });
  }

  /// 取消定时器
  void cancel() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
    }
  }
}
