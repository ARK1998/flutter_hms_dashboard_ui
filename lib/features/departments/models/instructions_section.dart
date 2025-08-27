import 'package:flutter/material.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/models/departments.dart';

class InstructionsSection extends StatelessWidget {
  const InstructionsSection(
    this.department, {
    Key? key,
  }) : super(key: key);

  final Department department;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 20),
      physics: const NeverScrollableScrollPhysics(),
      // Remove instructions reference
      itemCount: 0, // Since we're not using instructions anymore
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return Container(); // Return an empty container or modify this as needed
      },
    );
  }
}
