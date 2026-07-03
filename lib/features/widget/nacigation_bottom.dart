import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:food_app/core/logic/cubit/sing_to_app_with_email_and_password/login/login_cubit.dart';
import '../screens/ui/home/home_screen.dart';
import '../screens/ui/setting_screen/profile_screen.dart';
import '../screens/ui/saved_meals/saved_screen.dart';
// import '../screens/ui/search_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  List<Widget> page = [
    const HomeScreen(),
    // const SearchScreen(),
    const SavedScreen(),

    BlocProvider(
      create: (context) => LoginCubit(),
      child: const ProfileScreen(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          // BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Saved',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),

      body: page[_selectedIndex],
    );
  }
}
