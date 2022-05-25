import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:task_app/constants/colors.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/screens/detailPage/widgets/datePicke.dart';
import 'package:task_app/screens/detailPage/widgets/taskTimeLine.dart';
import 'package:task_app/screens/detailPage/widgets/taskTitle.dart';

class DetailPage extends StatelessWidget {
  final TaskModel task;
  DetailPage({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var detailList = task.description;
    return Scaffold(
      backgroundColor: AppColor.darkColor,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                  color: AppColor.mainColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Column(
                children: const [DatePicker(), TaskTitle()],
              ),
            ),
          ),
          detailList == null
              ? SliverFillRemaining(
                  child: Container(
                    color: AppColor.mainColor,
                    child: const Center(
                      child: Text(
                        "No Task Today",
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    ),
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                  (context, index) => TaskTimeLine(detail: detailList[index]),
                  childCount: detailList.length,
                ))
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 90,
      backgroundColor: AppColor.darkColor,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_ios),
        iconSize: 30,
      ),
      actions: const [
        Icon(
          Icons.more_vert,
          size: 40,
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${task.title} tasks',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "You have ${task.left} task for today!",
              style: TextStyle(
                fontSize: 12,
                color: AppColor.mainColor.withOpacity(.5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
