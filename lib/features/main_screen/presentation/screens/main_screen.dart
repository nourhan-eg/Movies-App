import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/app_colors.dart';
import '../../../../core/app_icons.dart';
import '../../../../core/di/di.dart';
import '../../home/presentation/bloc/home_bloc.dart';
import '../../home/presentation/bloc/home_event.dart';
import '../../home/presentation/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _selectedIndex = 0;

  final List<Widget> _tabs =  [
    BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(FetchMoviesEvent()),
        child: HomeScreen()),
    Center(child: Text('Search ',style: TextStyle(color: Colors.white,fontSize: 30),)),
    Center(child: Text('Browse ',style: TextStyle(color: Colors.white,fontSize: 30))),
    Center(child: Text('Profile ',style: TextStyle(color: Colors.white,fontSize: 30))),
  ];
  final List<String> _icons = const [
    AppIcons.homeIcon,
    AppIcons.searchIcon,
    AppIcons.browseIcon,
    AppIcons.profileIcon,
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          _tabs[_selectedIndex],
          Positioned(
            bottom: height*0.015,
            left: width*0.015,
            right: width*0.015,
            child: Container(
              padding:  EdgeInsets.symmetric(vertical: height*0.01),
              decoration: BoxDecoration(
                color: AppColors.darkGrey,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(_icons.length, (index) {
                  final isSelected = _selectedIndex == index;
                  return IconButton(
                    icon: SvgPicture.asset(
                      _icons[index],
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        isSelected ? AppColors.yellow : AppColors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}