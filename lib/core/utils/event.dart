import 'dart:async';

import 'package:event_bus/event_bus.dart';

//EventBus工具类
class XEvent {
  XEvent._internal();

  static Map<String, EventBus> sEventPool = {};

  static Map<String, List<StreamSubscription>> sStreamPool = {};

  static EventBus getEvent(String eventName, {bool isSync = false}) {
    EventBus event = sEventPool[eventName];
    if (event == null) {
      event = new EventBus(sync: isSync);
      sEventPool[eventName] = event;
    }
    return event;
  }

  //订阅信息, 默认是异步的
  static StreamSubscription<T> on<T>(String eventName, void onData(T event),
      {bool isSync = false,
      Function onError,
      void onDone(),
      bool cancelOnError}) {
    StreamSubscription<T> stream = getEvent(eventName, isSync: isSync)
        .on<T>()
        .listen(onData,
            onError: onError, onDone: onDone, cancelOnError: cancelOnError);

    List<StreamSubscription> streams = sStreamPool[eventName];
    if (streams == null) {
      streams = [];
      streams.add(stream);
      sStreamPool[eventName] = streams;
    } else {
      streams.add(stream);
    }
    return stream;
  }

  //事件发送
  static void post(String eventName, event) {
    EventBus eventBus = getEvent(eventName);
    eventBus.fire(event);
  }

  //订阅取消
  static void cancelAll(String eventName) {
    List<StreamSubscription> streams = sStreamPool[eventName];
    if (streams != null) {
      for (StreamSubscription item in streams) {
        item.cancel();
      }
      streams.clear();
    }
  }

  //订阅取消
  static void cancel(String eventName, StreamSubscription subscription) {
    if (subscription == null) return;
    List<StreamSubscription> streams = sStreamPool[eventName];
    if (streams != null) {
      subscription.cancel();
      streams.remove(subscription);
    }
  }
}
