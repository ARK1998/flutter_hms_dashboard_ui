import 'package:flutter/material.dart';
import 'package:flutter_hms_dashboard_ui/core/widgets/adaptive_offset_effect.dart';
import 'package:flutter_hms_dashboard_ui/core/widgets/app_bar_leading.dart';
import 'package:flutter_hms_dashboard_ui/core/widgets/fade_in_effect.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/models/departments.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/views/widgets/departments_image.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/views/widgets/departments_image_pattern_mouse.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/views/widgets/departments_page_image_bg.dart';

class DepartmentPageSidebar extends StatelessWidget {
  const DepartmentPageSidebar(
    this.department, {
    Key? key,
    this.imageRotationAngle = 0,
  }) : super(key: key);

  final Department department;
  final double imageRotationAngle;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return AdaptiveOffsetEffect.builder(
      width: screenSize.width / 2,
      height: screenSize.height,
      child: DepartmentPageImageBg(
        department,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      childBuilder: (context, offset, child) => Stack(
        children: [
          child!,
          if (department.bgImageName.isNotEmpty)
            FadeInEffect(
              intervalStart: 0.5,
              child: DepartmentImagePatternMouse(
                department,
                offset: offset,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
            ),
          IgnorePointer(
            ignoring: true,
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: DepartmentImage(
                  department,
                  imageRotationAngle: imageRotationAngle,
                  shadowOffset: offset * 0.5,
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 20,
            child: AppBarLeading(
              text: 'Back to Departments',
              popValue: imageRotationAngle,
            ),
          ),
        ],
      ),
    );
  }
}
