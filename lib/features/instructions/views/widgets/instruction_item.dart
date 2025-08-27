import 'package:flutter/material.dart';
import 'package:flutter_hms_dashboard_ui/core/styles/app_colors.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/models/departments.dart';

class InstructionItem extends StatelessWidget {
  const InstructionItem(
    this.department, {
    Key? key,
    required this.index,
  }) : super(key: key);

  final Department department;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        border: Border.all(color: department.bgColor, width: 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(
            offset: const Offset(0, -10),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: department.bgColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.orangeDark.withOpacity(
                      AppColors.getBrightness(department.bgColor) ==
                              Brightness.dark
                          ? 0.5
                          : 0.2,
                    ),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Transform.rotate(
                angle: -0.3,
                child: Text(
                  '${index + 1}',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall, // Updated to headlineSmall
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                //shift
                //department.instructions[index],
                department.toString()[index],
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge! // Updated to bodyLarge
                    .copyWith(height: 1.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
