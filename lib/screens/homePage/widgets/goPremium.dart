import 'package:flutter/material.dart';
import 'package:task_app/constants/colors.dart';

class GoPremium extends StatelessWidget {
  const GoPremium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppColor.darkColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.grey[800], shape: BoxShape.circle),
                  child: const Icon(
                    Icons.star,
                    color: AppColor.mainColor,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "GoPremium",
                      style: TextStyle(
                          color: AppColor.mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Get unlimited access\nto all our featuers!",
                      style: TextStyle(
                          color: AppColor.mainColor.withOpacity(.6),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 15,
            right: 15,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: AppColor.blueColor,
                  borderRadius: BorderRadius.circular(10)),
              child: const Icon(
                Icons.arrow_forward,
                color: AppColor.mainColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
