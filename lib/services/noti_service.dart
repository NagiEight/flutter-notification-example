import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotiService {
  // Initialize notification channel
  static void initialize() {
    AwesomeNotifications().initialize(
      null, // Use app icon
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic Notifications',
          channelDescription: 'Channel for basic notification tests',
          defaultColor: Colors.deepPurple,
          ledColor: Colors.white,
          importance: NotificationImportance.High,
          channelShowBadge: true,
        ),
      ],
      debug: true,
    );
  }

  // Request permission to send notifications
  static Future<void> requestPermission() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }

  // Show a basic notification
  static Future<void> showNotification({
    required String title,
    required String body,
  }) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
        channelKey: 'basic_channel',
        title: title,
        body: body,
        notificationLayout: NotificationLayout.Default,
      ),
    );
  }
}
