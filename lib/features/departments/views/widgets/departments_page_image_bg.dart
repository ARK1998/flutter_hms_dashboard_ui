import 'package:flutter/material.dart';
import 'package:flutter_hms_dashboard_ui/core/styles/app_colors.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/models/departments.dart';

class DepartmentPageImageBg extends StatelessWidget {
  const DepartmentPageImageBg(
    this.department, {
    Key? key,
    required this.borderRadius,
  }) : super(key: key);

  final Department department;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '__department_${department.id}_image_bg__',
      child: Container(
        decoration: BoxDecoration(
          color: department.bgColor,
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: AppColors.orangeDark.withOpacity(
                AppColors.getBrightness(department.bgColor) == Brightness.dark
                    ? 0.5
                    : 0.2,
              ),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
