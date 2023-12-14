import 'dart:async';

class EventsWorker {
  Timer? timer;
  Duration duration;
  Function onFire;

  EventsWorker(this.duration, this.onFire);

  void start() {
    timer = Timer.periodic(duration, (timer) {
      onFire();
    });
  }

  void stop() {
    if (timer != null) {
      timer!.cancel();
    }
  }
}
