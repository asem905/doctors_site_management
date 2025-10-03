import 'package:flutter/material.dart';
import 'package:flutter_complete_proj/core/helpers/spacing.dart';
import 'package:flutter_complete_proj/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:flutter_complete_proj/features/home/ui/widgets/home_top_bar.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(
            20.0,
            16.0,
            20.0,
            28.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              DoctorsBlueContainer(),
              // verticalSpacing(24),
              // const DoctorsSpecialitySeeAll(),
              // verticalSpacing(18),
              // const SpecializationsBlocBuilder(),
              // verticalSpacing(8),
              // const DoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}