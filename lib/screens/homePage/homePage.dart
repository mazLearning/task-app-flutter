import 'package:flutter/material.dart';
import 'package:task_app/constants/colors.dart';
import 'package:task_app/screens/homePage/widgets/goPremium.dart';
import 'package:task_app/screens/homePage/widgets/task.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GoPremium(),
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text(
              "Task",
              style: TextStyle(
                fontSize: 22,
                color: AppColor.textColor,
              ),
            ),
          ),
          Expanded(child: Task()),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        backgroundColor: AppColor.darkColor,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColor.mainColor,
      elevation: 0,
      title: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/images/avatar.jpg'),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            "Hi, Mohammadali",
            style: TextStyle(
                color: AppColor.textColor,
                fontSize: 23,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: const [
        Icon(
          Icons.more_vert,
          size: 40,
          color: AppColor.textColor,
        )
      ],
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColor.darkColor.withOpacity(.1),
              spreadRadius: 5,
              blurRadius: 10,
            ),
          ]),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: AppColor.mainColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
                label: "Home",
                icon: Icon(
                  Icons.home_rounded,
                  size: 30,
                )),
            BottomNavigationBarItem(
                label: "Person",
                icon: Icon(
                  Icons.person_rounded,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }
}
