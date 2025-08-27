import 'package:flutter/material.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/models/departments.dart';

class IngredientsSection extends StatelessWidget {
  const IngredientsSection(
    this.department, {
    Key? key,
  }) : super(key: key);

  final Department department;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 0,
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return Container();
      },
    );
  }
}
