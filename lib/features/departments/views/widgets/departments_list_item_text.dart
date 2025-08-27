import 'package:flutter/material.dart';
import 'package:flutter_hms_dashboard_ui/core/enums/screen_size.dart';
import 'package:flutter_hms_dashboard_ui/core/styles/app_colors.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/models/departments.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/views/widgets/departments_list_item_text_wrapper.dart';

class DepartmentListItemText extends StatelessWidget {
  const DepartmentListItemText(
    this.menuItem, {
    Key? key,
  }) : super(key: key);

  final Department menuItem;

  @override
  Widget build(BuildContext context) {
    return DepartmentListItemTextWrapper(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: ScreenSize.of(context).isLarge ? 40 : 20,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: ScreenSize.of(context).isLarge
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          children: [
            Hero(
              tag: '__department_${menuItem.id}_title__',
              child: Text(
                menuItem.title,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      // Updated to headlineLarge
                      color:
                          AppColors.textColorFromBackground(menuItem.bgColor),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
