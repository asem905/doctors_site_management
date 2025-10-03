import 'package:flutter/material.dart';
import 'package:flutter_complete_proj/core/helpers/spacing.dart';
import 'package:flutter_complete_proj/core/theming/colors.dart';
import 'package:flutter_complete_proj/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/styles.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  final List<SpecializationsData?> specializationDataList;
  const DoctorsSpecialityListView({super.key, required this.specializationDataList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationDataList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorsManager.lightBlue,
                  child: SvgPicture.asset(
                    'assets/svgs/general_speciality.svg',
                    height: 40.h,
                    width: 40.w,
                  ),
                ),
                verticalSpacing(8),
                Text(
                  specializationDataList[index]?.name ?? '',
                  style: TextStyles.font12DarkBlueRegular,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}