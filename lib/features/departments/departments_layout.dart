import 'package:flutter/material.dart';
import 'package:flutter_hms_dashboard_ui/core/enums/screen_size.dart';

class DepartmentsLayout {
  final BuildContext context;

  DepartmentsLayout(this.context);

  static DepartmentsLayout of(BuildContext context) {
    return DepartmentsLayout(context);
  }

  int get gridCrossAxisCount {
    // Adjust grid cross axis count based on screen size
    switch (ScreenSize.of(context)) {
      case ScreenSize.xs:
      case ScreenSize.sm:
        return 1;
      case ScreenSize.md:
        return 2;
      case ScreenSize.lg:
      case ScreenSize.xl:
      case ScreenSize.xxl:
        return 3;
    }
  }

  double get gridChildAspectRatio {
    // Adjust aspect ratio based on screen size for responsive layout
    switch (ScreenSize.of(context)) {
      case ScreenSize.xs:
      case ScreenSize.sm:
        return 1.5; // More vertical layout on small screens
      case ScreenSize.md:
        return 2; // A bit more square for medium-sized screens
      case ScreenSize.lg:
        return 1.5;
      case ScreenSize.xl:
        return 1.5;
      case ScreenSize.xxl:
        return 1.5;
    }
  }

  double get departmentImageSize {
    // Calculate department image size based on screen size
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust image size proportionally depending on grid count
    return screenWidth * 0.45 / gridCrossAxisCount;
  }

  // Optionally adjust font size dynamically, for instance:
  double get fontSize {
    // Dynamically adjust font size based on screen size
    switch (ScreenSize.of(context)) {
      case ScreenSize.xs:
      case ScreenSize.sm:
        return 12; // Smaller font size for smaller screens
      case ScreenSize.md:
        return 14; // Medium font size for medium screens
      case ScreenSize.lg:
        return 16; // Larger font size for larger screens
      case ScreenSize.xl:
        return 18;
      case ScreenSize.xxl:
        return 20; // Even larger font size for xxl screens
    }
  }
}