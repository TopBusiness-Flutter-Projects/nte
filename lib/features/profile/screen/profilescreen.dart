import 'package:flutter/material.dart';
import 'package:nte/core/utils/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bink,
      body: Center(
        child: Text(
          'Profile',
          style: TextStyle(color: AppColors.black),
        ),
      ),
    );
  }
}
