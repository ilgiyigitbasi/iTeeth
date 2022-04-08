import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iteeth/utilities.dart';
import 'dart:convert';

Future<void> createPlantFoodNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'basic_channel',
      title:
          '${Emojis.time_alarm_clock + Emojis.plant_cactus} Buy Plant Food!!!',
      body: 'Dişini Fırçalamayı unutmayın!!!',
      notificationLayout: NotificationLayout.BigPicture,
    ),
  );
}


Future<void> createWaterReminderNotification(
    NotificationWeekAndTime notificationSchedule) async {
  for (int i = 1; i <= 7; i++) {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'scheduled_channel',
        title: '${Emojis.household_toothbrush} iTeeth',
        body: 'Dişlerinizi fırçalamayı unutmayın',
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'MARK_DONE',
          label: 'Mark Done',
        ),
      ],
      schedule: NotificationCalendar(
        hour: notificationSchedule.timeOfDay.hour,
        minute: notificationSchedule.timeOfDay.minute,
        second: 0,
        millisecond: 0,
        repeats: true,
      ),
    );
  }


}

Future<void> cancelScheduledNotifications() async {
  await AwesomeNotifications().cancelAllSchedules();
}

getNotifications() async {

  var list =await AwesomeNotifications().listScheduledNotifications();
  //
  // Map<String, dynamic> jsonData =
  // json.decode(list) as Map<String, dynamic>;

  print(list[0].schedule);
  // print(list[1].schedule);
  // print(list[2].schedule);
  // print(list[3].schedule);
  // print(list[4].schedule);
  // print(list[5].schedule);
  // print(list[6].schedule);


}



