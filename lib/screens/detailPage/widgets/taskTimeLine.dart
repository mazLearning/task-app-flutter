import 'package:flutter/material.dart';
import 'package:task_app/constants/colors.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TaskTimeLine extends StatelessWidget {
  final Map<String, dynamic> detail;
  TaskTimeLine({Key? key, required this.detail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.mainColor,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          _buildTimeLine(detail['timeLineColor']),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(detail['time']),
                detail['title'].isNotEmpty
                    ? _buildCard(detail['backgroundColor'], detail['title'],
                        detail['slot'])
                    : _buildCard(AppColor.mainColor, '', ''),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCard(Color backgroundColor, String title, String slot) {
    return Container(
      // constraints: BoxConstraints(minWidth: 200),
      width: 240,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColor.textColor,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            slot,
            style: TextStyle(
              color: AppColor.textColor.withOpacity(.5),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeLine(Color timelineColor) {
    return Container(
      height: 80,
      width: 20,
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0,
        isFirst: true,
        indicatorStyle: IndicatorStyle(
            indicatorXY: 0,
            width: 15,
            indicator: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(width: 5, color: timelineColor),
              ),
            )),
        afterLineStyle: LineStyle(
          thickness: 2,
          color: timelineColor,
        ),
      ),
    );
  }
}
