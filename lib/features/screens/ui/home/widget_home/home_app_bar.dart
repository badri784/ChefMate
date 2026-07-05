import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/logic/user_info/user_info_cubit.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoCubit, UserInfoState>(
      builder: (context, state) {
        if (state is UserInfoError) {
          return const SafeArea(child: Center(child: Text('error data')));
        }
        if (state is UserInfoLoading) {
          return const Center(
            child: FadeShimmer(
              height: 80,
              width: double.infinity,
              radius: 4,
              fadeTheme: FadeTheme.dark,
              highlightColor: Colors.black,
              baseColor: Color(0xffE6E8EB),
            ),
          );
        }
        if (state is UserInfoSuccess) {
          return AppBar(
            primary: true,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Container(
                padding: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
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
                  'Hello, ${state.name}',
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
        return const SizedBox.shrink();
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
