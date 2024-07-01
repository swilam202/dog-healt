import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;

class LocalNotificationServices {
  FlutterLocalNotificationsPlugin localNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    tz.initializeTimeZones();
    const AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings('@drawable/ic_stat_1');
    DarwinInitializationSettings darwinInitializationSettings =
    DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
    );

    InitializationSettings settings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );
    await localNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
    );

    print('************************');

  }


  Future<NotificationDetails> notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'description',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
    );

    const DarwinNotificationDetails darwinNotificationDetails =
    DarwinNotificationDetails();

    return const NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );
  }


  Future<void> showScheduledNotification(
      {required int id,
        required String title,
        required String body,
        required DateTime seconds}) async {
    print('---------------------');

    NotificationDetails details = await notificationDetails();
    print('++++++++++++++++');
   // print(tz.TZDateTime.from(seconds, tz.local));
    print(seconds);
    print('++++++++++++++++');

    localNotificationsPlugin.schedule(
      id,
      title,
      body,
      seconds,
      //tz.TZDateTime.from(seconds, tz.local),
      details,
      //uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      //androidScheduleMode: AndroidScheduleMode.alarmClock,
      androidAllowWhileIdle: true

    );
  }




  void _onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {}

  void _onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    // final String payload = notificationResponse.payload!;
    // Get.to(SecondryScreen(payload));
  }


}