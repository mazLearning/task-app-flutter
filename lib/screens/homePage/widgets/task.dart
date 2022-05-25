import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:task_app/constants/colors.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/screens/detailPage/detailPage.dart';

class Task extends StatelessWidget {
  final taskList = TaskModel.generateTask();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: AppColor.mainColor,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: taskList.length,
          itemBuilder: (context, index) {
            return taskList[index].isList
                ? __buildAddTask()
                : _buildTask(context, taskList[index]);
          }),
    );
  }

  Widget __buildAddTask() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(20),
      dashPattern: const [10, 10],
      color: Colors.grey,
      strokeWidth: 2,
      child: const Center(
        child: Text(
          "+ Add",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColor.textColor),
        ),
      ),
    );
  }

  Widget _buildTask(BuildContext context, TaskModel task) {
    var title = task.title;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (contextBuilder) {
          return DetailPage(task: task);
        }));
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: task.backgroundColor,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              task.iconData,
              color: task.iconColor,
              size: 35,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              task.title!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.textColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                _buildTaskStatus(task.backgroundColor!, task.iconColor!,
                    '${task.left} left'),
                const SizedBox(
                  width: 5,
                ),
                _buildTaskStatus(AppColor.textColor, AppColor.mainColor,
                    '${task.done} right'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTaskStatus(Color backgroundColor, Color textColor, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: textColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(color: backgroundColor),
      ),
    );
  }
}
