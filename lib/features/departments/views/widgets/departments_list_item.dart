import 'package:flutter/material.dart';
import 'package:flutter_hms_dashboard_ui/core/enums/screen_size.dart';
import 'package:flutter_hms_dashboard_ui/core/styles/app_colors.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/models/departments.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/departments_layout.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/views/pages/departments_page.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/views/widgets/departments_image.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/views/widgets/departments_list_item_gesture_detector.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/views/widgets/departments_list_item_image_wrapper.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/views/widgets/departments_list_item_text.dart';

class DepartmentListItem extends StatefulWidget {
  const DepartmentListItem(
    this.department, {
    Key? key,
  }) : super(key: key);

  final Department department;

  @override
  State<DepartmentListItem> createState() => _DepartmentListItemState();
}

class _DepartmentListItemState extends State<DepartmentListItem> {
  double recipeImageRotationAngle = 0;

  @override
  Widget build(BuildContext context) {
    double imageSize = DepartmentsLayout.of(context).departmentImageSize;

    return DepartmentListItemGestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder:
                (BuildContext context, Animation<double> animation, _) {
              return DepartmentPage(
                widget.department,
                initialImageRotationAngle: recipeImageRotationAngle,
              );
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation, _, Widget child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        )
            .then((response) {
          if (response != null && response is double && mounted) {
            setState(() {
              recipeImageRotationAngle = response;
            });
          }
        });
      },
      child: Padding(
        padding: EdgeInsets.all(ScreenSize.of(context).isLarge ? 15 : 12.5),
        child: Stack(
          children: [
            Positioned.fill(
              child: Hero(
                tag: '__department_${widget.department.id}_image_bg__',
                child: Container(
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    color: widget.department.bgColor,
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.orangeDark.withOpacity(
                          AppColors.getBrightness(widget.department.bgColor) ==
                                  Brightness.dark
                              ? 0.5
                              : 0.2,
                        ),
                        blurRadius: 10,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  // child: DepartmentListItemImage(department),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                alignment: Alignment.bottomRight,
                child: DepartmentListItemImageWrapper(
                  child: DepartmentImage(
                    widget.department,
                    imageRotationAngle: recipeImageRotationAngle,
                    imageSize: imageSize,
                    alignment: Alignment.bottomRight,
                    hasShadow: false,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: DepartmentListItemText(widget.department),
                ),
                Expanded(flex: 2, child: Container()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
