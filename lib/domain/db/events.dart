import 'package:hive/hive.dart';

import '../../app/settings.dart';
import '../../network/body/event.dart';

class EventsDb {
  final _events = Hive.box<Event>(DbSettings.eventsBox);

  Future<void> cacheEvent(id, item) async {
    return _events.put(id, item);
  }

  Future<void> deleteCachedEvent(id) async {
    return _events.delete(id);
  }

  Future<int> clearEventsCache() async {
    return _events.clear();
  }

  List<Event> getCachedEvents() {
    return _events.values.toList().cast();
  }

  Event? getEventById(id) {
    return _events.get(id);
  }

  void changeEventStatusAndTimestamp(id, status, serverTimestamp) {
    Event? event = getEventById(id);
    if (event != null) {
      event.status = status;
      event.serverTimestamp = serverTimestamp;
      _events.put(id, event);
    }
  }

  void changeEventStatus(id, status) {
    Event? event = getEventById(id);
    if (event != null) {
      event.status = status;
      _events.put(id, event);
    }
  }

  void increaseTrials(id) {
    Event? event = getEventById(id);
    if (event != null) {
      int trials = (event.trials ?? 0) + 1;
      event.trials = trials;
      _events.put(id, event);
    }
  }
}
