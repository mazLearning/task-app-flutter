import 'package:flutter/material.dart';
import 'package:task_app/constants/colors.dart';

class TaskModel {
  IconData? iconData;
  String? title;
  Color? backgroundColor;
  Color? iconColor;
  Color? btnColor;
  num? left;
  num? done;
  bool isList;
  List<Map<String, dynamic>>? description;

  TaskModel({
    this.iconData,
    this.title,
    this.backgroundColor,
    this.iconColor,
    this.btnColor,
    this.left,
    this.done,
    required this.isList,
    this.description,
  });

  static List<TaskModel> generateTask() {
    return [
      TaskModel(
          iconData: Icons.person_rounded,
          title: "Personal",
          backgroundColor: AppColor.kYellowLight,
          iconColor: AppColor.kYellowDark,
          btnColor: AppColor.kYellow,
          left: 3,
          done: 1,
          isList: false,
          description: [
            {
              'time': '10:00 am',
              'title': 'Programming Flutter',
              'slot': '10:00 - 12:00 am',
              'timeLineColor': AppColor.kRedDark,
              'backgroundColor': AppColor.kRedLight,
            },
            {
              'time': '9:00 am',
              'title': 'Django Backend',
              'slot': '9:00 - 10:00 am',
              'timeLineColor': AppColor.kBlueDark,
              'backgroundColor': AppColor.kBlueLight,
            },
            {
              'time': '11:00 am',
              'title': '',
              'slot': '',
              'timeLineColor': AppColor.kBlueDark,
            },
            {
              'time': '12:00 am',
              'title': '',
              'slot': '',
              'timeLineColor': AppColor.textColor.withOpacity(.3),
            },
            {
              'time': '1:00 pm',
              'title': 'Nodejs and react app',
              'slot': '1:00 - 2:00 pm',
              'timeLineColor': AppColor.kYellowDark,
              'backgroundColor': AppColor.kYellowLight,
            },
            {
              'time': '2:00 pm',
              'title': '',
              'slot': '',
              'timeLineColor': AppColor.kYellowDark,
            },
            {
              'time': '3:00 pm',
              'title': '',
              'slot': '',
              'timeLineColor': AppColor.kYellowDark,
            },
          ]),
      TaskModel(
          iconData: Icons.cases_rounded,
          title: "Work",
          backgroundColor: AppColor.kRedLight,
          iconColor: AppColor.kRedDark,
          btnColor: AppColor.kRed,
          left: 0,
          done: 0,
          isList: false),
      TaskModel(
          iconData: Icons.favorite_rounded,
          title: "Health",
          backgroundColor: AppColor.kBlueLight,
          iconColor: AppColor.kBlueDark,
          btnColor: AppColor.kBlue,
          left: 0,
          done: 0,
          isList: false),
      TaskModel(isList: true)
    ];
  }
}
