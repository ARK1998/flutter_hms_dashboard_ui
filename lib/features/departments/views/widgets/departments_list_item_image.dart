import 'package:flutter/material.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/models/departments.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/departments_layout.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/views/widgets/departments_list_item_image_wrapper.dart';

class DepartmentListItemImage extends StatelessWidget {
  const DepartmentListItemImage(
    this.department, {
    Key? key,
    this.imageRotationAngle = 0,
  }) : super(key: key);

  final Department department;
  final double imageRotationAngle;

  @override
  Widget build(BuildContext context) {
    double imageSize = DepartmentsLayout.of(context).departmentImageSize;

    return DepartmentListItemImageWrapper(
      child: Hero(
        tag: '__recipe_${department.id}_image__',
        child: Transform.rotate(
          angle: imageRotationAngle,
          child: Image.asset(
            department.image,
            width: imageSize,
          ),
        ),
      ),
    );
  }
}
