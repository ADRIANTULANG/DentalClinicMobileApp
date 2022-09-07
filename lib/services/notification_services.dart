import 'dart:math';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../configs/endPoints.dart';

class NotificationServices extends GetxService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String? token;

  @override
  Future<void> onInit() async {
    getToken();
    await notificationSetup();
    await onBackgroundMessage();
    await onForegroundMessage();
    super.onInit();
  }

  Future<void> notificationSetup() async {
    AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          importance: NotificationImportance.High,
        ),
        NotificationChannel(
          channelKey: 'basic_channel_muted',
          channelName: 'Basic muted notifications ',
          channelDescription: 'Notification channel for muted basic tests',
          importance: NotificationImportance.High,
          playSound: false,
        )
      ],
    );
  }

  Future<void> onForegroundMessage() async {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        print('Got a message whilst in the foreground!');
        print('Message data: ${message.data}');

        if (message.notification != null) {
          print(
              'Message also contained a notification: ${message.notification}');

          // if (Get.find<StorageService>().storage.read("notificationSound") ==
          //     true) {
          //   AwesomeNotifications().createNotification(
          //     content: NotificationContent(
          //       id: Random().nextInt(9999),
          //       channelKey: 'basic_channel',
          //       title: '${message.notification!.title}',
          //       body: '${message.notification!.body}',
          //       notificationLayout: NotificationLayout.BigText,
          //     ),
          //   );
          // } else {
          AwesomeNotifications().createNotification(
            content: NotificationContent(
              id: Random().nextInt(9999),
              channelKey: 'basic_channel_muted',
              title: '${message.notification!.title}',
              body: '${message.notification!.body}',
              notificationLayout: NotificationLayout.BigText,
            ),
          );
          // }

          // call_unseen_messages();
        }
      },
    );
  }

  Future<void> checkNotificationPermission() async {
    await messaging.requestPermission();
    // if (Get.find<StorageService>().storage.read('token') == "") {
    //   await getToken();
    // }
  }

  Future<void> getToken() async {
    token = await messaging.getToken();

    // Get.find<StorageService>().updateToken(token);
    print('Generated device token: $token');
  }

  sendNotification({required String userToken}) async {
    print("token: $token");
    var e2epushnotif = await http.post(
        Uri.parse('${AppEndpoint.endPointDomain}/push-notification.php'),
        body: {
          "fcmtoken": userToken,
          "title": "e2epush notif title",
          "body": "e2epush notif body"
        });
    print("e2e notif: ${e2epushnotif.body}");

    // var mynotif = await http.post(
    //     Uri.parse('${AppEndpoint.endPointDomain}/push-notification-other.php'),
    //     body: {
    //       "fcmtoken": userToken,
    //       "title": "my notif title",
    //       "body": "my notif body"
    //     });
    // print("mynotif: ${mynotif.body}");
  }
}

Future<void> onBackgroundMessage() async {
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}
