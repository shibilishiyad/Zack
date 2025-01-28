import 'package:flutter/material.dart';

class NotificationProvider with ChangeNotifier {
  final List<String> _notifications = [];

  List<String> get notifications => _notifications;

  bool get hasNewNotifications => _notifications.isNotEmpty;

  void addNotification(String notification) {
    _notifications.add(notification);
    notifyListeners();
  }

  void clearNotifications() {
    _notifications.clear();
    notifyListeners();
  }
}
