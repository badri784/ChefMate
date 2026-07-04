import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      primary: true,

      // animateColor: false,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Container(
          padding: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
            shape: BoxShape.circle,
          ),
          child: const CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage('assets/image/download.jpg'),
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello, Ahmed',
            style: TextStyle(
              fontSize: 18,
              color: ColorScheme.of(context).onSurface,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Text(
            'CulinaShare',
            style: TextStyle(color: Color(0xffb02f00), fontSize: 22),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_none,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
