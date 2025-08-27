import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hms_dashboard_ui/core/styles/app_colors.dart';
import 'package:flutter_hms_dashboard_ui/core/widgets/adaptive_offset_effect.dart';
import 'package:flutter_hms_dashboard_ui/core/widgets/app_bar_leading.dart';
import 'package:flutter_hms_dashboard_ui/core/widgets/fade_in_effect.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/models/departments.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/views/widgets/departments_image.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/views/widgets/departments_image_pattern.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/views/widgets/departments_page_image_bg.dart';

class DepartmentPageSliverAppBar extends StatelessWidget {
  const DepartmentPageSliverAppBar({
    Key? key,
    required this.department,
    this.expandedHeight = 340,
    this.collapsedHeight = 200,
    this.imageRotationAngle = 0,
  }) : super(key: key);

  final Department department;
  final double expandedHeight;
  final double? collapsedHeight;
  final double imageRotationAngle;

  @override
  Widget build(BuildContext context) {
    double imageSize = MediaQuery.of(context).size.width * 0.7;

    return SliverAppBar(
      pinned: true,
      stretch: true,
      backgroundColor: Colors.transparent,
      collapsedHeight: collapsedHeight,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: AppColors.getBrightness(department.bgColor),
      ),
      leading: AppBarLeading(
        popValue: imageRotationAngle,
        bgColor: AppColors.textColorFromBackground(department.bgColor),
      ),
      expandedHeight: expandedHeight + MediaQuery.of(context).padding.top,
      flexibleSpace: AdaptiveOffsetEffect.builder(
        width: MediaQuery.of(context).size.width,
        height: expandedHeight,
        child: DepartmentPageImageBg(
          department,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(35),
            bottomLeft: Radius.circular(35),
          ),
        ),
        childBuilder: (BuildContext context, Offset offset, Widget? child) {
          return Stack(
            children: [
              child!,
              if (department.bgImage.isNotEmpty)
                FlexibleSpaceBar(
                  background: FadeInEffect(
                    intervalStart: 0.5,
                    child: Opacity(
                      opacity: 0.6,
                      child: DepartmentImagePattern(
                        offset: offset,
                        department,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(35),
                          bottomLeft: Radius.circular(35),
                        ),
                      ),
                    ),
                  ),
                ),
              SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: DepartmentImage(
                    department,
                    imageRotationAngle: imageRotationAngle,
                    imageSize: imageSize,
                    shadowOffset: offset * 0.6,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
