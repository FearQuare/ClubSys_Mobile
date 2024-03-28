import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          title: Image.asset(
            "lib/images/clubSys_yatay_logo.png",
            height: 200,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(
                Icons.notifications,
                size: 30,
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
