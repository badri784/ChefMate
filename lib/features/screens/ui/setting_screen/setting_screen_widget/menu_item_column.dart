import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/helpers/spacing.dart';
import 'package:food_app/core/logic/cubit/sing_to_app_with_email_and_password/login/login_cubit.dart';
import 'package:food_app/features/screens/ui/setting_screen/setting_screen_widget/build_menu_item.dart';

class MenuItemColumn extends StatelessWidget {
  const MenuItemColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileMenuItem(
          icon: Icons.person_outline,
          title: 'Personal Details',
          color: const Color(0xFF4CAF50),
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.notifications_none,
          title: 'Notifications',
          color: const Color(0xFFFFC107),
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.settings_outlined,
          title: 'Settings',
          color: Colors.blue,
          onTap: () {},
        ),
        ProfileMenuItem(
          icon: Icons.help_outline,
          title: 'Help & Support',
          color: Colors.purple,
          onTap: () {},
        ),
        verticalSpace(20),
        BlocProvider(
          create: (_) => LoginCubit(),
          child: Builder(
            builder: (context) {
              return ProfileMenuItem(
                icon: Icons.logout,
                title: 'Log Out',
                color: Colors.red,
                isLogout: true,
                onTap: () => context.read<LoginCubit>().logOut(context),
              );
            },
          ),
        ),
        verticalSpace(40),
      ],
    );
  }
}
