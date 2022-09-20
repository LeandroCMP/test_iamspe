import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/models/mensagens/mensagem-alerta.model.dart';
import 'package:iamspeapp/models/mensagens/notificacao.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  dev.log("passou aqui");
  var prefs = await SharedPreferences.getInstance();
  var mensagemJson = prefs.getString("mensagensBackground");
  List<MensagemAlertaModel> mensagemBackground = [];
  if (mensagemJson != null) {
    mensagemBackground = (jsonDecode(mensagemJson) as List)
        .map((i) => MensagemAlertaModel.fromJson(i))
        .toList();
  }
  dev.log(
      "-----------------------------Handling a background message   $message");
  mensagemBackground = [
    ...mensagemBackground,
    MensagemAlertaModel(
        notification: NotificacaoModel(
            body: message.notification?.body,
            title: message.notification?.title),
        messageId: message.messageId,
        backgroundReceive: true)
  ];
  await prefs.setString("mensagensBackground", jsonEncode(mensagemBackground));
  // var mensagemJson2 = prefs.getString("mensagensBackground");
  // dev.log("-------------------save---${jsonEncode(mensagemJson2)}");
  // if (message.containsKey('data')) {
  //   // Handle data message
  //   final dynamic data = message['data'];
  // }

  // if (message.containsKey('notification')) {
  //   final NotificacaoModel notification =
  //       NotificacaoModel.fromMap(message['notification']);
  //   notification.lido = false;
  //   return notification;
  // }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<MensagemAlertaModel> _messages = [];
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  late FlutterLocalNotificationsPlugin fltNotification;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      pushFCMtoken();
      initMessaging();
    }
  }

  void pushFCMtoken() async {
    try {
      String? token = await messaging.getToken();
      dev.log("Push token: $token");
    } catch (e) {
      dev.log("erro token: $e");
    }
  }

  Future<void> initMessaging() async {
    try {
      var androiInit =
          const AndroidInitializationSettings('@mipmap/ic_launcher');
      var iosInit = const IOSInitializationSettings();
      var initSetting =
          InitializationSettings(android: androiInit, iOS: iosInit);
      fltNotification = FlutterLocalNotificationsPlugin();
      fltNotification.initialize(initSetting);
//     fltNotification.initialize(initSetting,
//         onSelectNotification: (String payload) async {
      //  if(payload=="<Condition A>"){
      //     // show page A
      //  }else{
      //     //show page B
      //  }
// //function to navigate to the page you want to show after tapping //push notification
//     });
      var androidDetails = const AndroidNotificationDetails(
        '1',
        'channelName',
      );
      var iosDetails = const IOSNotificationDetails();
      var generalNotificationDetails =
          NotificationDetails(android: androidDetails, iOS: iosDetails);

      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        Map<String, dynamic> data = message.data;
        dev.log(
            "_messaging onMessage: ${message.senderId}-----${message.messageId}");
        //Fcm.showNotification(notification.body, notification.title);
        String? type = data['type'];
        if (type == "view") {
          String? notifPath = data['subject'];
          //notificationProvider.addPath(notifPath);
          dev.log('new notification added to notificationList: $notifPath');
        }
        if (notification != null && android != null) {
          fltNotification.show(notification.hashCode, notification.title,
              notification.body, generalNotificationDetails);
//             fltNotification.show(
// notification.hashCode, notification.title, notification.body, generalNotificationDetails,payload: “Notification”);
        }
        var prefs = await SharedPreferences.getInstance();
        var mensagemJson = prefs.getString("mensagens");
        if (mensagemJson != null) {
          _messages = (jsonDecode(mensagemJson) as List)
              .map((i) => MensagemAlertaModel.fromJson(i))
              .toList();
        }
        setState(() {
          _messages = [
            ..._messages,
            MensagemAlertaModel(
                notification: NotificacaoModel(
                    body: message.notification?.body,
                    title: message.notification?.title),
                messageId: message.messageId,
                backgroundReceive: false)
          ];
        });

        await prefs.setString("mensagens", jsonEncode(_messages));
      });

      FirebaseMessaging.instance.getInitialMessage().then((value) {
        dev.log("_messaging getInitialMessage: $value");
      });
      FirebaseMessaging.onMessageOpenedApp
          .listen((RemoteMessage message) async {
        int encontrou;
        dev.log(
            "_messaging onMessageOpenedApp--------------------------: $message");
        var prefs = await SharedPreferences.getInstance();
        var mensagemJson = prefs.getString("mensagens");
        if (mensagemJson != null) {
          _messages = (jsonDecode(mensagemJson) as List)
              .map((i) => MensagemAlertaModel.fromJson(i))
              .toList();
        }
        dev.log(
            "-mensagens-------------------------: ${jsonEncode(_messages)}");
        encontrou = _messages
            .indexWhere((element) => element.messageId == message.messageId);
        _messages
            .removeWhere((element) => element.messageId == message.messageId);
        if (encontrou == -1) {
          await prefs.setString("mensagensBackground", jsonEncode(_messages));
          dev.log(
              "-mensagens--after-----------------------: ${jsonEncode(_messages)}");
          List<MensagemAlertaModel> _messagesBack = [];
          var mensagemJsonBackground = prefs.getString("mensagensBackground");
          if (mensagemJsonBackground != null) {
            _messagesBack = (jsonDecode(mensagemJsonBackground) as List)
                .map((i) => MensagemAlertaModel.fromJson(i))
                .toList();
          }
          dev.log(
              "-mensagens-back------------------------: ${jsonEncode(_messagesBack)}");
          _messagesBack
              .removeWhere((element) => element.messageId == message.messageId);

          await prefs.setString(
              "mensagensBackground", jsonEncode(_messagesBack));
          dev.log(
              "-mensagens--after-back----------------------: ${jsonEncode(_messagesBack)}");
        }
      });
      FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    } catch (e) {
      dev.log('erro mensageria:', error: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Iamspe',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
