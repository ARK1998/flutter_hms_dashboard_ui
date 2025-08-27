import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hms_dashboard_ui/core/enums/screen_size.dart';
import 'package:flutter_hms_dashboard_ui/core/styles/app_colors.dart';
import 'package:flutter_hms_dashboard_ui/features/instructions/views/widgets/instructions_section.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/models/departments.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/views/widgets/departments_page_sidebar.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/views/widgets/departments_page_sliver_app_bar.dart';

class DepartmentPage extends StatefulWidget {
  const DepartmentPage(
    this.department, {
    Key? key,
    this.initialImageRotationAngle = 0,
  }) : super(key: key);

  final Department department;
  final double initialImageRotationAngle;

  @override
  State<DepartmentPage> createState() => _RecipePageState();
}

class _RecipePageState extends State<DepartmentPage> {
  final ScrollController scrollController = ScrollController();
  late final ValueNotifier<double> imageRotationAngleNotifier;

  void scrollListener() {
    ScrollDirection scrollDirection =
        scrollController.position.userScrollDirection;
    double scrollPosition = scrollController.position.pixels.abs();
    if (scrollDirection == ScrollDirection.forward) {
      imageRotationAngleNotifier.value +=
          (scrollPosition * math.pi / 180) * 0.01;
    } else if (scrollDirection == ScrollDirection.reverse) {
      imageRotationAngleNotifier.value -=
          (scrollPosition * math.pi / 180) * 0.01;
    }
  }

  @override
  void initState() {
    scrollController.addListener(scrollListener);
    imageRotationAngleNotifier =
        ValueNotifier<double>(widget.initialImageRotationAngle);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    imageRotationAngleNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final department = widget.department;

    // Check if the current department is the 'General' department with id = 1
    if (department.id == 1) {
      // Special layout for the 'General' department
      return Scaffold(
        backgroundColor:
            department.bgColor == AppColors.sugar ? AppColors.yellow : null,
        body: Row(
          children: [
            if (ScreenSize.of(context).isLarge)
              Expanded(
                flex: 1,
                child: ValueListenableBuilder(
                  valueListenable: imageRotationAngleNotifier,
                  builder: (context, double imageRotationAngle, child) {
                    return DepartmentPageSidebar(
                      department,
                      imageRotationAngle: imageRotationAngle,
                    );
                  },
                ),
              ),
            Expanded(
              flex: 1,
              child: CustomScrollView(
                controller: scrollController,
                cacheExtent: 0,
                slivers: [
                  if (!ScreenSize.of(context).isLarge)
                    ValueListenableBuilder(
                      valueListenable: imageRotationAngleNotifier,
                      builder: (context, double imageRotationAngle, child) {
                        return DepartmentPageSliverAppBar(
                          imageRotationAngle: imageRotationAngle,
                          department: department,
                        );
                      },
                    ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.of(context).isLarge ? 70 : 17,
                      vertical: ScreenSize.of(context).isLarge ? 50 : 20,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        // Centering the title in the SliverList
                        // Hero(
                        //   tag: '__department_${department.id}_title__',
                        //   child: Center(
                        //     child: Text(
                        //       department.title,
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .headlineLarge, // Updated to headlineLarge
                        //       textAlign:
                        //           TextAlign.center, // Ensures text is centered
                        //     ),
                        //   ),
                        // ),
                        ////////////////////////////////////////////////////////
                        Hero(
                          tag: '__department_${department.id}_title__',
                          child: Center(
                            child: Text(
                              department.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontSize:
                                        25, // Adjust the font size as needed
                                  ),
                              textAlign:
                                  TextAlign.center, // Ensures text is centered
                            ),
                          ),
                        ),
                        ////////////////////////////////////////////////////////
                        InstructionsSection(department),
                        const SizedBox(
                            height: 20), // Add some space before the options
                        // Directly show navigation options for the 'General' department
                        _buildGeneralDepartmentNavigation(),
                      ]),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    // Check if the current department is the 'OPD' department with id = 2
    else if (department.id == 2) {
      // Special layout for the 'OPD' department
      return Scaffold(
        backgroundColor:
            department.bgColor == AppColors.sugar ? AppColors.yellow : null,
        body: Row(
          children: [
            if (ScreenSize.of(context).isLarge)
              Expanded(
                flex: 1,
                child: ValueListenableBuilder(
                  valueListenable: imageRotationAngleNotifier,
                  builder: (context, double imageRotationAngle, child) {
                    return DepartmentPageSidebar(
                      department,
                      imageRotationAngle: imageRotationAngle,
                    );
                  },
                ),
              ),
            Expanded(
              flex: 1,
              child: CustomScrollView(
                controller: scrollController,
                cacheExtent: 0,
                slivers: [
                  if (!ScreenSize.of(context).isLarge)
                    ValueListenableBuilder(
                      valueListenable: imageRotationAngleNotifier,
                      builder: (context, double imageRotationAngle, child) {
                        return DepartmentPageSliverAppBar(
                          imageRotationAngle: imageRotationAngle,
                          department: department,
                        );
                      },
                    ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.of(context).isLarge ? 70 : 17,
                      vertical: ScreenSize.of(context).isLarge ? 50 : 20,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        // Centering the title in the SliverList
                        // Hero(
                        //   tag: '__department_${department.id}_title__',
                        //   child: Center(
                        //     child: Text(
                        //       department.title,
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .headlineLarge, // Updated to headlineLarge
                        //       textAlign:
                        //           TextAlign.center, // Ensures text is centered
                        //     ),
                        //   ),
                        // ),
                        ////////////////////////////////////////////////////////
                        Hero(
                          tag: '__department_${department.id}_title__',
                          child: Center(
                            child: Text(
                              department.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontSize:
                                        25, // Adjust the font size as needed
                                  ),
                              textAlign:
                                  TextAlign.center, // Ensures text is centered
                            ),
                          ),
                        ),
                        ////////////////////////////////////////////////////////
                        InstructionsSection(department),
                        const SizedBox(
                            height: 20), // Add some space before the options
                        // Directly show navigation options for the 'OPD' department
                        _buildOPDDepartmentNavigation(),
                      ]),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
    //////////////////////////////////////////////////////////////////////////
    //////////////////////////////////ER=3////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////
    // Check if the current department is the 'ER' department with id = 3
    else if (department.id == 3) {
      // Special layout for the 'ER' department
      return Scaffold(
        backgroundColor:
            department.bgColor == AppColors.sugar ? AppColors.yellow : null,
        body: Row(
          children: [
            if (ScreenSize.of(context).isLarge)
              Expanded(
                flex: 1,
                child: ValueListenableBuilder(
                  valueListenable: imageRotationAngleNotifier,
                  builder: (context, double imageRotationAngle, child) {
                    return DepartmentPageSidebar(
                      department,
                      imageRotationAngle: imageRotationAngle,
                    );
                  },
                ),
              ),
            Expanded(
              flex: 1,
              child: CustomScrollView(
                controller: scrollController,
                cacheExtent: 0,
                slivers: [
                  if (!ScreenSize.of(context).isLarge)
                    ValueListenableBuilder(
                      valueListenable: imageRotationAngleNotifier,
                      builder: (context, double imageRotationAngle, child) {
                        return DepartmentPageSliverAppBar(
                          imageRotationAngle: imageRotationAngle,
                          department: department,
                        );
                      },
                    ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.of(context).isLarge ? 70 : 17,
                      vertical: ScreenSize.of(context).isLarge ? 50 : 20,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        // Centering the title in the SliverList
                        // Hero(
                        //   tag: '__department_${department.id}_title__',
                        //   child: Center(
                        //     child: Text(
                        //       department.title,
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .headlineLarge, // Updated to headlineLarge
                        //       textAlign:
                        //           TextAlign.center, // Ensures text is centered
                        //     ),
                        //   ),
                        // ),
                        ////////////////////////////////////////////////////////
                        Hero(
                          tag: '__department_${department.id}_title__',
                          child: Center(
                            child: Text(
                              department.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontSize:
                                        25, // Adjust the font size as needed
                                  ),
                              textAlign:
                                  TextAlign.center, // Ensures text is centered
                            ),
                          ),
                        ),
                        ////////////////////////////////////////////////////////
                        InstructionsSection(department),
                        const SizedBox(
                            height: 20), // Add some space before the options
                        // Directly show navigation options for the 'ER' department
                        _buildERDepartmentNavigation(),
                      ]),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
      //////////////////////////////////////////////////////////////////////////
      /////////////////////////Radiology = 4////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////
      // Check if the current department is the 'Radiology' department with id = 4
    } else if (department.id == 4) {
      // Special layout for the 'Radiology' department
      return Scaffold(
        backgroundColor:
            department.bgColor == AppColors.sugar ? AppColors.yellow : null,
        body: Row(
          children: [
            if (ScreenSize.of(context).isLarge)
              Expanded(
                flex: 1,
                child: ValueListenableBuilder(
                  valueListenable: imageRotationAngleNotifier,
                  builder: (context, double imageRotationAngle, child) {
                    return DepartmentPageSidebar(
                      department,
                      imageRotationAngle: imageRotationAngle,
                    );
                  },
                ),
              ),
            Expanded(
              flex: 1,
              child: CustomScrollView(
                controller: scrollController,
                cacheExtent: 0,
                slivers: [
                  if (!ScreenSize.of(context).isLarge)
                    ValueListenableBuilder(
                      valueListenable: imageRotationAngleNotifier,
                      builder: (context, double imageRotationAngle, child) {
                        return DepartmentPageSliverAppBar(
                          imageRotationAngle: imageRotationAngle,
                          department: department,
                        );
                      },
                    ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.of(context).isLarge ? 70 : 17,
                      vertical: ScreenSize.of(context).isLarge ? 50 : 20,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        // Centering the title in the SliverList
                        // Hero(
                        //   tag: '__department_${department.id}_title__',
                        //   child: Center(
                        //     child: Text(
                        //       department.title,
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .headlineLarge, // Updated to headlineLarge
                        //       textAlign:
                        //           TextAlign.center, // Ensures text is centered
                        //     ),
                        //   ),
                        // ),
                        ////////////////////////////////////////////////////////
                        Hero(
                          tag: '__department_${department.id}_title__',
                          child: Center(
                            child: Text(
                              department.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontSize:
                                        25, // Adjust the font size as needed
                                  ),
                              textAlign:
                                  TextAlign.center, // Ensures text is centered
                            ),
                          ),
                        ),
                        ////////////////////////////////////////////////////////
                        InstructionsSection(department),
                        const SizedBox(
                            height: 20), // Add some space before the options
                        // Directly show navigation options for the 'ER' department
                        _buildRadiologyDepartmentNavigation(),
                      ]),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
      //////////////////////////////////////////////////////////////////////////
      /////////////////////////IPD = 5 /////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////
      // Check if the current department is the 'IDP' department with id = 5
    } else if (department.id == 5) {
      // Special layout for the 'IPD' department
      return Scaffold(
        backgroundColor:
            department.bgColor == AppColors.sugar ? AppColors.yellow : null,
        body: Row(
          children: [
            if (ScreenSize.of(context).isLarge)
              Expanded(
                flex: 1,
                child: ValueListenableBuilder(
                  valueListenable: imageRotationAngleNotifier,
                  builder: (context, double imageRotationAngle, child) {
                    return DepartmentPageSidebar(
                      department,
                      imageRotationAngle: imageRotationAngle,
                    );
                  },
                ),
              ),
            Expanded(
              flex: 1,
              child: CustomScrollView(
                controller: scrollController,
                cacheExtent: 0,
                slivers: [
                  if (!ScreenSize.of(context).isLarge)
                    ValueListenableBuilder(
                      valueListenable: imageRotationAngleNotifier,
                      builder: (context, double imageRotationAngle, child) {
                        return DepartmentPageSliverAppBar(
                          imageRotationAngle: imageRotationAngle,
                          department: department,
                        );
                      },
                    ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.of(context).isLarge ? 70 : 17,
                      vertical: ScreenSize.of(context).isLarge ? 50 : 20,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        // Centering the title in the SliverList
                        // Hero(
                        //   tag: '__department_${department.id}_title__',
                        //   child: Center(
                        //     child: Text(
                        //       department.title,
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .headlineLarge, // Updated to headlineLarge
                        //       textAlign:
                        //           TextAlign.center, // Ensures text is centered
                        //     ),
                        //   ),
                        // ),
                        ////////////////////////////////////////////////////////
                        Hero(
                          tag: '__department_${department.id}_title__',
                          child: Center(
                            child: Text(
                              department.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontSize:
                                        25, // Adjust the font size as needed
                                  ),
                              textAlign:
                                  TextAlign.center, // Ensures text is centered
                            ),
                          ),
                        ),
                        ////////////////////////////////////////////////////////
                        InstructionsSection(department),
                        const SizedBox(
                            height: 20), // Add some space before the options
                        // Directly show navigation options for the 'ER' department
                        _buildIPDDepartmentNavigation(),
                      ]),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

      ///
      ///
    } else if (department.id == 6) {
      // Special layout for the 'Lab' department
      return Scaffold(
        backgroundColor:
            department.bgColor == AppColors.sugar ? AppColors.yellow : null,
        body: Row(
          children: [
            if (ScreenSize.of(context).isLarge)
              Expanded(
                flex: 1,
                child: ValueListenableBuilder(
                  valueListenable: imageRotationAngleNotifier,
                  builder: (context, double imageRotationAngle, child) {
                    return DepartmentPageSidebar(
                      department,
                      imageRotationAngle: imageRotationAngle,
                    );
                  },
                ),
              ),
            Expanded(
              flex: 1,
              child: CustomScrollView(
                controller: scrollController,
                cacheExtent: 0,
                slivers: [
                  if (!ScreenSize.of(context).isLarge)
                    ValueListenableBuilder(
                      valueListenable: imageRotationAngleNotifier,
                      builder: (context, double imageRotationAngle, child) {
                        return DepartmentPageSliverAppBar(
                          imageRotationAngle: imageRotationAngle,
                          department: department,
                        );
                      },
                    ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.of(context).isLarge ? 70 : 17,
                      vertical: ScreenSize.of(context).isLarge ? 50 : 20,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        // Centering the title in the SliverList
                        // Hero(
                        //   tag: '__department_${department.id}_title__',
                        //   child: Center(
                        //     child: Text(
                        //       department.title,
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .headlineLarge, // Updated to headlineLarge
                        //       textAlign:
                        //           TextAlign.center, // Ensures text is centered
                        //     ),
                        //   ),
                        // ),
                        ////////////////////////////////////////////////////////
                        Hero(
                          tag: '__department_${department.id}_title__',
                          child: Center(
                            child: Text(
                              department.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontSize:
                                        25, // Adjust the font size as needed
                                  ),
                              textAlign:
                                  TextAlign.center, // Ensures text is centered
                            ),
                          ),
                        ),
                        ////////////////////////////////////////////////////////
                        InstructionsSection(department),
                        const SizedBox(
                            height: 20), // Add some space before the options
                        // Directly show navigation options for the 'ER' department
                        _buildLabDepartmentNavigation(),
                      ]),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

      ///
      ///
    } else if (department.id == 7) {
      // Special layout for the 'Patients Diet' department
      return Scaffold(
        backgroundColor:
            department.bgColor == AppColors.sugar ? AppColors.yellow : null,
        body: Row(
          children: [
            if (ScreenSize.of(context).isLarge)
              Expanded(
                flex: 1,
                child: ValueListenableBuilder(
                  valueListenable: imageRotationAngleNotifier,
                  builder: (context, double imageRotationAngle, child) {
                    return DepartmentPageSidebar(
                      department,
                      imageRotationAngle: imageRotationAngle,
                    );
                  },
                ),
              ),
            Expanded(
              flex: 1,
              child: CustomScrollView(
                controller: scrollController,
                cacheExtent: 0,
                slivers: [
                  if (!ScreenSize.of(context).isLarge)
                    ValueListenableBuilder(
                      valueListenable: imageRotationAngleNotifier,
                      builder: (context, double imageRotationAngle, child) {
                        return DepartmentPageSliverAppBar(
                          imageRotationAngle: imageRotationAngle,
                          department: department,
                        );
                      },
                    ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.of(context).isLarge ? 70 : 17,
                      vertical: ScreenSize.of(context).isLarge ? 50 : 20,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        // Centering the title in the SliverList
                        // Hero(
                        //   tag: '__department_${department.id}_title__',
                        //   child: Center(
                        //     child: Text(
                        //       department.title,
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .headlineLarge, // Updated to headlineLarge
                        //       textAlign:
                        //           TextAlign.center, // Ensures text is centered
                        //     ),
                        //   ),
                        // ),
                        ////////////////////////////////////////////////////////
                        Hero(
                          tag: '__department_${department.id}_title__',
                          child: Center(
                            child: Text(
                              department.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontSize:
                                        25, // Adjust the font size as needed
                                  ),
                              textAlign:
                                  TextAlign.center, // Ensures text is centered
                            ),
                          ),
                        ),
                        ////////////////////////////////////////////////////////
                        InstructionsSection(department),
                        const SizedBox(
                            height: 20), // Add some space before the options
                        // Directly show navigation options for the 'ER' department
                        _buildPatientsDietDepartmentNavigation(),
                      ]),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

      ///
      ///
    } else if (department.id == 8) {
      // Special layout for the 'Inventory' department
      return Scaffold(
        backgroundColor:
            department.bgColor == AppColors.sugar ? AppColors.yellow : null,
        body: Row(
          children: [
            if (ScreenSize.of(context).isLarge)
              Expanded(
                flex: 1,
                child: ValueListenableBuilder(
                  valueListenable: imageRotationAngleNotifier,
                  builder: (context, double imageRotationAngle, child) {
                    return DepartmentPageSidebar(
                      department,
                      imageRotationAngle: imageRotationAngle,
                    );
                  },
                ),
              ),
            Expanded(
              flex: 1,
              child: CustomScrollView(
                controller: scrollController,
                cacheExtent: 0,
                slivers: [
                  if (!ScreenSize.of(context).isLarge)
                    ValueListenableBuilder(
                      valueListenable: imageRotationAngleNotifier,
                      builder: (context, double imageRotationAngle, child) {
                        return DepartmentPageSliverAppBar(
                          imageRotationAngle: imageRotationAngle,
                          department: department,
                        );
                      },
                    ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.of(context).isLarge ? 70 : 17,
                      vertical: ScreenSize.of(context).isLarge ? 50 : 20,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        // Centering the title in the SliverList
                        // Hero(
                        //   tag: '__department_${department.id}_title__',
                        //   child: Center(
                        //     child: Text(
                        //       department.title,
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .headlineLarge, // Updated to headlineLarge
                        //       textAlign:
                        //           TextAlign.center, // Ensures text is centered
                        //     ),
                        //   ),
                        // ),
                        ////////////////////////////////////////////////////////
                        Hero(
                          tag: '__department_${department.id}_title__',
                          child: Center(
                            child: Text(
                              department.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontSize:
                                        25, // Adjust the font size as needed
                                  ),
                              textAlign:
                                  TextAlign.center, // Ensures text is centered
                            ),
                          ),
                        ),
                        ////////////////////////////////////////////////////////
                        InstructionsSection(department),
                        const SizedBox(
                            height: 20), // Add some space before the options
                        // Directly show navigation options for the 'ER' department
                        _buildInventoryDepartmentNavigation(),
                      ]),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
      //
      //
      //
      //////////////////////////////////////////////////////////
    } else if (department.id == 9) {
      // Special layout for the 'Purchase & Payables' department

      return Scaffold(
        backgroundColor:
            department.bgColor == AppColors.sugar ? AppColors.yellow : null,
        body: Row(
          children: [
            if (ScreenSize.of(context).isLarge)
              Expanded(
                flex: 1,
                child: ValueListenableBuilder(
                  valueListenable: imageRotationAngleNotifier,
                  builder: (context, double imageRotationAngle, child) {
                    return DepartmentPageSidebar(
                      department,
                      imageRotationAngle: imageRotationAngle,
                    );
                  },
                ),
              ),
            Expanded(
              flex: 1,
              child: CustomScrollView(
                controller: scrollController,
                cacheExtent: 0,
                slivers: [
                  if (!ScreenSize.of(context).isLarge)
                    ValueListenableBuilder(
                      valueListenable: imageRotationAngleNotifier,
                      builder: (context, double imageRotationAngle, child) {
                        return DepartmentPageSliverAppBar(
                          imageRotationAngle: imageRotationAngle,
                          department: department,
                        );
                      },
                    ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.of(context).isLarge ? 70 : 17,
                      vertical: ScreenSize.of(context).isLarge ? 50 : 20,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        // Centering the title in the SliverList
                        // Hero(
                        //   tag: '__department_${department.id}_title__',
                        //   child: Center(
                        //     child: Text(
                        //       department.title,
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .headlineLarge, // Updated to headlineLarge
                        //       textAlign:
                        //           TextAlign.center, // Ensures text is centered
                        //     ),
                        //   ),
                        // ),
                        //////////////////////////////////////////////////////////
                        Hero(
                          tag: '__department_${department.id}_title__',
                          child: Center(
                            child: Text(
                              department.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontSize:
                                        25, // Adjust the font size as needed
                                  ),
                              textAlign:
                                  TextAlign.center, // Ensures text is centered
                            ),
                          ),
                        ),
                        //////////////////////////////////////////////////////////
                        InstructionsSection(department),
                        const SizedBox(
                            height: 20), // Add some space before the options
                        // Directly show navigation options for the 'ER' department
                        _buildPurchaseAndPayablesDepartmentNavigation(),
                      ]),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
      //////////////////////////////////////////////////////////////////////////
      //////////////////////////////////////////////////////////////////////////
    } else if (department.id == 10) {
      // Special layout for the 'Financial Accounts' department
      return Scaffold(
        backgroundColor:
            department.bgColor == AppColors.sugar ? AppColors.yellow : null,
        body: Row(
          children: [
            if (ScreenSize.of(context).isLarge)
              Expanded(
                flex: 1,
                child: ValueListenableBuilder(
                  valueListenable: imageRotationAngleNotifier,
                  builder: (context, double imageRotationAngle, child) {
                    return DepartmentPageSidebar(
                      department,
                      imageRotationAngle: imageRotationAngle,
                    );
                  },
                ),
              ),
            Expanded(
              flex: 1,
              child: CustomScrollView(
                controller: scrollController,
                cacheExtent: 0,
                slivers: [
                  if (!ScreenSize.of(context).isLarge)
                    ValueListenableBuilder(
                      valueListenable: imageRotationAngleNotifier,
                      builder: (context, double imageRotationAngle, child) {
                        return DepartmentPageSliverAppBar(
                          imageRotationAngle: imageRotationAngle,
                          department: department,
                        );
                      },
                    ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.of(context).isLarge ? 70 : 17,
                      vertical: ScreenSize.of(context).isLarge ? 50 : 20,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        //// Centering the title in the SliverList
                        // Hero(
                        //   tag: '__department_${department.id}_title__',
                        //   child: Center(
                        //     child: Text(
                        //       department.title,
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .headlineLarge, // Updated to headlineLarge
                        //       textAlign:
                        //           TextAlign.center, // Ensures text is centered
                        //     ),
                        //   ),
                        // ),
                        ////////////////////////////////////////////////////////
                        Hero(
                          tag: '__department_${department.id}_title__',
                          child: Center(
                            child: Text(
                              department.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontSize:
                                        25, // Adjust the font size as needed
                                  ),
                              textAlign:
                                  TextAlign.center, // Ensures text is centered
                            ),
                          ),
                        ),
                        ////////////////////////////////////////////////////////
                        InstructionsSection(department),
                        const SizedBox(
                            height: 20), // Add some space before the options
                        // Directly show navigation options for the 'ER' department
                        _buildFinancialAccountsDepartmentNavigation(),
                      ]),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

      //
      //
      //
      //
    } else if (department.id == 11) {
      // Special layout for the 'CWS' department
      return Scaffold(
        backgroundColor:
            department.bgColor == AppColors.sugar ? AppColors.yellow : null,
        body: Row(
          children: [
            if (ScreenSize.of(context).isLarge)
              Expanded(
                flex: 1,
                child: ValueListenableBuilder(
                  valueListenable: imageRotationAngleNotifier,
                  builder: (context, double imageRotationAngle, child) {
                    return DepartmentPageSidebar(
                      department,
                      imageRotationAngle: imageRotationAngle,
                    );
                  },
                ),
              ),
            Expanded(
              flex: 1,
              child: CustomScrollView(
                controller: scrollController,
                cacheExtent: 0,
                slivers: [
                  if (!ScreenSize.of(context).isLarge)
                    ValueListenableBuilder(
                      valueListenable: imageRotationAngleNotifier,
                      builder: (context, double imageRotationAngle, child) {
                        return DepartmentPageSliverAppBar(
                          imageRotationAngle: imageRotationAngle,
                          department: department,
                        );
                      },
                    ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.of(context).isLarge ? 70 : 17,
                      vertical: ScreenSize.of(context).isLarge ? 50 : 20,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        // Centering the title in the SliverList
                        // Hero(
                        //   tag: '__department_${department.id}_title__',
                        //   child: Center(
                        //     child: Text(
                        //       department.title,
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .headlineLarge, // Updated to headlineLarge
                        //       textAlign:
                        //           TextAlign.center, // Ensures text is centered
                        //     ),
                        //   ),
                        // ),
                        ////////////////////////////////////////////////////////
                        Hero(
                          tag: '__department_${department.id}_title__',
                          child: Center(
                            child: Text(
                              department.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontSize:
                                        25, // Adjust the font size as needed
                                  ),
                              textAlign:
                                  TextAlign.center, // Ensures text is centered
                            ),
                          ),
                        ),
                        ////////////////////////////////////////////////////////
                        InstructionsSection(department),
                        const SizedBox(
                            height: 20), // Add some space before the options
                        // Directly show navigation options for the 'CWS' department
                        _buildCWSDepartmentNavigation(),
                      ]),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
      //
      //
    } else if (department.id == 12) {
      // Special layout for the 'Pharmacy' department
      return Scaffold(
        backgroundColor:
            department.bgColor == AppColors.sugar ? AppColors.yellow : null,
        body: Row(
          children: [
            if (ScreenSize.of(context).isLarge)
              Expanded(
                flex: 1,
                child: ValueListenableBuilder(
                  valueListenable: imageRotationAngleNotifier,
                  builder: (context, double imageRotationAngle, child) {
                    return DepartmentPageSidebar(
                      department,
                      imageRotationAngle: imageRotationAngle,
                    );
                  },
                ),
              ),
            Expanded(
              flex: 1,
              child: CustomScrollView(
                controller: scrollController,
                cacheExtent: 0,
                slivers: [
                  if (!ScreenSize.of(context).isLarge)
                    ValueListenableBuilder(
                      valueListenable: imageRotationAngleNotifier,
                      builder: (context, double imageRotationAngle, child) {
                        return DepartmentPageSliverAppBar(
                          imageRotationAngle: imageRotationAngle,
                          department: department,
                        );
                      },
                    ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.of(context).isLarge ? 70 : 17,
                      vertical: ScreenSize.of(context).isLarge ? 50 : 20,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        // Centering the title in the SliverList
                        // Hero(
                        //   tag: '__department_${department.id}_title__',
                        //   child: Center(
                        //     child: Text(
                        //       department.title,
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .headlineLarge, // Updated to headlineLarge
                        //       textAlign:
                        //           TextAlign.center, // Ensures text is centered
                        //     ),
                        //   ),
                        // ),
                        ////////////////////////////////////////////////////////
                        Hero(
                          tag: '__department_${department.id}_title__',
                          child: Center(
                            child: Text(
                              department.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontSize:
                                        25, // Adjust the font size as needed
                                  ),
                              textAlign:
                                  TextAlign.center, // Ensures text is centered
                            ),
                          ),
                        ),
                        ////////////////////////////////////////////////////////
                        InstructionsSection(department),
                        const SizedBox(
                            height: 20), // Add some space before the options
                        // Directly show navigation options for the 'Pharmacy' department
                        _buildPharmacyDepartmentNavigation(),
                      ]),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
      //
      //
    } else if (department.id == 13) {
      // Special layout for the 'Equipment Maintenance' department
      return Scaffold(
        backgroundColor:
            department.bgColor == AppColors.sugar ? AppColors.yellow : null,
        body: Row(
          children: [
            if (ScreenSize.of(context).isLarge)
              Expanded(
                flex: 1,
                child: ValueListenableBuilder(
                  valueListenable: imageRotationAngleNotifier,
                  builder: (context, double imageRotationAngle, child) {
                    return DepartmentPageSidebar(
                      department,
                      imageRotationAngle: imageRotationAngle,
                    );
                  },
                ),
              ),
            Expanded(
              flex: 1,
              child: CustomScrollView(
                controller: scrollController,
                cacheExtent: 0,
                slivers: [
                  if (!ScreenSize.of(context).isLarge)
                    ValueListenableBuilder(
                      valueListenable: imageRotationAngleNotifier,
                      builder: (context, double imageRotationAngle, child) {
                        return DepartmentPageSliverAppBar(
                          imageRotationAngle: imageRotationAngle,
                          department: department,
                        );
                      },
                    ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.of(context).isLarge ? 70 : 17,
                      vertical: ScreenSize.of(context).isLarge ? 50 : 20,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        // Centering the title in the SliverList
                        // Hero(
                        //   tag: '__department_${department.id}_title__',
                        //   child: Center(
                        //     child: Text(
                        //       department.title,
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .headlineLarge, // Updated to headlineLarge
                        //       textAlign:
                        //           TextAlign.center, // Ensures text is centered
                        //     ),
                        //   ),
                        // ),
                        ////////////////////////////////////////////////////////
                        Hero(
                          tag: '__department_${department.id}_title__',
                          child: Center(
                            child: Text(
                              department.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontSize:
                                        25, // Adjust the font size as needed
                                  ),
                              textAlign:
                                  TextAlign.center, // Ensures text is centered
                            ),
                          ),
                        ),
                        ////////////////////////////////////////////////////////
                        InstructionsSection(department),
                        const SizedBox(
                            height: 20), // Add some space before the options
                        // Directly show navigation options for the 'Equipment Maintenance' department
                        _buildEquipmentMaintenanceDepartmentNavigation(),
                      ]),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
      //
      //
    } else if (department.id == 14) {
      // Special layout for the 'Patient History' department
      return Scaffold(
        backgroundColor:
            department.bgColor == AppColors.sugar ? AppColors.yellow : null,
        body: Row(
          children: [
            if (ScreenSize.of(context).isLarge)
              Expanded(
                flex: 1,
                child: ValueListenableBuilder(
                  valueListenable: imageRotationAngleNotifier,
                  builder: (context, double imageRotationAngle, child) {
                    return DepartmentPageSidebar(
                      department,
                      imageRotationAngle: imageRotationAngle,
                    );
                  },
                ),
              ),
            Expanded(
              flex: 1,
              child: CustomScrollView(
                controller: scrollController,
                cacheExtent: 0,
                slivers: [
                  if (!ScreenSize.of(context).isLarge)
                    ValueListenableBuilder(
                      valueListenable: imageRotationAngleNotifier,
                      builder: (context, double imageRotationAngle, child) {
                        return DepartmentPageSliverAppBar(
                          imageRotationAngle: imageRotationAngle,
                          department: department,
                        );
                      },
                    ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.of(context).isLarge ? 70 : 17,
                      vertical: ScreenSize.of(context).isLarge ? 50 : 20,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        // Centering the title in the SliverList
                        // Hero(
                        //   tag: '__department_${department.id}_title__',
                        //   child: Center(
                        //     child: Text(
                        //       department.title,
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .headlineLarge, // Updated to headlineLarge
                        //       textAlign:
                        //           TextAlign.center, // Ensures text is centered
                        //     ),
                        //   ),
                        // ),
                        ////////////////////////////////////////////////////////
                        Hero(
                          tag: '__department_${department.id}_title__',
                          child: Center(
                            child: Text(
                              department.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontSize:
                                        25, // Adjust the font size as needed
                                  ),
                              textAlign:
                                  TextAlign.center, // Ensures text is centered
                            ),
                          ),
                        ),
                        ////////////////////////////////////////////////////////
                        InstructionsSection(department),
                        const SizedBox(
                            height: 20), // Add some space before the options
                        // Directly show navigation options for the 'Patient History' department
                        _buildPatientHistoryDepartmentNavigation(),
                      ]),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      // Default layout for all other departments
      return Scaffold(
        backgroundColor:
            department.bgColor == AppColors.sugar ? AppColors.yellow : null,
        body: Row(
          children: [
            if (ScreenSize.of(context).isLarge)
              Expanded(
                flex: 1,
                child: ValueListenableBuilder(
                  valueListenable: imageRotationAngleNotifier,
                  builder: (context, double imageRotationAngle, child) {
                    return DepartmentPageSidebar(
                      department,
                      imageRotationAngle: imageRotationAngle,
                    );
                  },
                ),
              ),
            Expanded(
              flex: 1,
              child: CustomScrollView(
                controller: scrollController,
                cacheExtent: 0,
                slivers: [
                  if (!ScreenSize.of(context).isLarge)
                    ValueListenableBuilder(
                      valueListenable: imageRotationAngleNotifier,
                      builder: (context, double imageRotationAngle, child) {
                        return DepartmentPageSliverAppBar(
                          imageRotationAngle: imageRotationAngle,
                          department: department,
                        );
                      },
                    ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenSize.of(context).isLarge ? 70 : 17,
                      vertical: ScreenSize.of(context).isLarge ? 50 : 20,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        // Centering the title in the SliverList
                        // Hero(
                        //   tag: '__department_${department.id}_title__',
                        //   child: Center(
                        //     child: Text(
                        //       department.title,
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .headlineLarge, // Updated to headlineLarge
                        //       textAlign:
                        //           TextAlign.center, // Ensures text is centered
                        //     ),
                        //   ),
                        // ),
                        ////////////////////////////////////////////////////////
                        Hero(
                          tag: '__department_${department.id}_title__',
                          child: Center(
                            child: Text(
                              department.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    fontSize:
                                        25, // Adjust the font size as needed
                                  ),
                              textAlign:
                                  TextAlign.center, // Ensures text is centered
                            ),
                          ),
                        ),
                        ////////////////////////////////////////////////////////
                        InstructionsSection(department),
                      ]),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

//General Navigation
  Widget _buildGeneralDepartmentNavigation() {
    return Column(
      children: [
        _buildSilverGradientButton("Service", () {
          // Handle Service navigation
        }),
        _buildSilverGradientButton("Doctor/Consultant", () {
          // Handle Doctor/Consultant navigation
        }),
        _buildSilverGradientButton("Cash Collecting Location", () {
          // Handle Cash Collecting Location navigation
        }),
        _buildSilverGradientButton("Party", () {
          // Handle Party navigation
        }),
        _buildSilverGradientButton("Duty Staff", () {
          // Handle Duty Staff navigation
        }),
        _buildSilverGradientButton("Department", () {
          // Handle Department navigation
        }),
        _buildSilverGradientButton("Cost Centre", () {
          // Handle Cost Centre navigation
        }),
        _buildSilverGradientButton("Sub Cost Centre", () {
          // Handle Sub Cost Centre navigation
        }),
        _buildSilverGradientButton("Cost Head", () {
          // Handle Cost Head navigation
        }),
        _buildSilverGradientButton("Payment Terms", () {
          // Handle Payment Terms navigation
        }),
        _buildSilverGradientButton("Country", () {
          // Handle Country navigation
        }),
        _buildSilverGradientButton("Unit", () {
          // Handle Unit navigation
        }),
        _buildSilverGradientButton("Specialty", () {
          // Handle Specialty navigation
        }),
        _buildSilverGradientButton("Ward Location", () {
          // Handle Ward Location navigation
        }),
        _buildSilverGradientButton("Generic", () {
          // Handle Generic navigation
        }),
        _buildSilverGradientButton("Cash Roster", () {
          // Handle Cash Roster navigation
        }),
        _buildSilverGradientButton("Discount", () {
          // Handle Discount navigation
        }),
        _buildSilverGradientButton("Diagnosis", () {
          // Handle Diagnosis navigation
        }),
        _buildSilverGradientButton("Assign Users to Approval Authority", () {
          // Handle Assign Users to Approval Authority navigation
        }),
      ],
    );
  }

//OPD Navigation
  Widget _buildOPDDepartmentNavigation() {
    return Column(
      children: [
        _buildSilverGradientButton("Reference", () {
          // Handle Reference navigation
        }),
        _buildSilverGradientButton("Appointment", () {
          // Handle Appointment navigation
        }),
        _buildSilverGradientButton("OPD Registration", () {
          // Handle OPD Registration navigation
        }),
        _buildSilverGradientButton("OPD Registration Cancellation", () {
          // Handle OPD Registration Cancellation navigation
        }),
        _buildSilverGradientButton("M.R. Merging", () {
          // Handle M.R. Merging navigation
        }),
        _buildSilverGradientButton("OPD Discount", () {
          // Handle OPD Discount navigation
        }),
        _buildSilverGradientButton("Patient Data", () {
          // Handle Patient Data navigation
        }),
        _buildSilverGradientButton("Consultant Office", () {
          // Handle Consultant Office navigation
        }),
      ],
    );
  }

//ER Navigation
  Widget _buildERDepartmentNavigation() {
    return Column(
      children: [
        _buildSilverGradientButton("Master", () {
          // Handle Service navigation
        }),
        _buildSilverGradientButton("Transaction", () {
          // Handle Doctor/Consultant navigation
        }),
        _buildSilverGradientButton("Reports", () {
          // Handle Cash Collecting Location navigation
        }),
      ],
    );
  }

  //Radiology Navigation
  Widget _buildRadiologyDepartmentNavigation() {
    return Column(
      children: [
        _buildSilverGradientButton("Master", () {
          // Handle Service navigation
        }),
        _buildSilverGradientButton("Transaction", () {
          // Handle Doctor/Consultant navigation
        }),
        _buildSilverGradientButton("Reports", () {
          // Handle Cash Collecting Location navigation
        }),
      ],
    );
  }

  //IPD Navigation
  Widget _buildIPDDepartmentNavigation() {
    return Column(
      children: [
        _buildSilverGradientButton("Reference", () {
          // Handle Service navigation
        }),
        _buildSilverGradientButton("Master", () {
          // Handle Doctor/Consultant navigation
        }),
        _buildSilverGradientButton("Patient", () {
          // Handle Cash Collecting Location navigation
        }),
        _buildSilverGradientButton("Other Transaction", () {
          // Handle Cash Collecting Location navigation
        }),
        _buildSilverGradientButton("Discharge", () {
          // Handle Cash Collecting Location navigation
        }),
        _buildSilverGradientButton("Patient Investigation", () {
          // Handle Cash Collecting Location navigation
        }),
        _buildSilverGradientButton("Patient Receipt & Refund", () {
          // Handle Cash Collecting Location navigation
        }),
        _buildSilverGradientButton("Create Shift", () {
          // Handle Cash Collecting Location navigation
        }),
        _buildSilverGradientButton("Close Shift", () {
          // Handle Cash Collecting Location navigation
        }),
        _buildSilverGradientButton("Direct Service", () {
          // Handle Cash Collecting Location navigation
        }),
        _buildSilverGradientButton("Party Wise Adjustment Against Bill", () {
          // Handle Cash Collecting Location navigation
        }),
        _buildSilverGradientButton("Corporate", () {
          // Handle Cash Collecting Location navigation
        }),
        _buildSilverGradientButton("Report", () {
          // Handle Cash Collecting Location navigation
        }),
        _buildSilverGradientButton("Views", () {
          // Handle Cash Collecting Location navigation
        }),
      ],
    );
  }

  //Lab Navigation
  Widget _buildLabDepartmentNavigation() {
    return Column(
      children: [
        _buildSilverGradientButton("Master", () {
          // Handle Service navigation
        }),
        _buildSilverGradientButton("Transaction", () {
          // Handle Doctor/Consultant navigation
        }),
        _buildSilverGradientButton("Test Result", () {
          // Handle Cash Collecting Location navigation
        }),
        _buildSilverGradientButton("Test Result (Editing)", () {
          // Handle Cash Collecting Location navigation
        }),
        _buildSilverGradientButton("Report", () {
          // Handle Cash Collecting Location navigation
        }),
      ],
    );
  }

  //Patient's Diet Navigation
  Widget _buildPatientsDietDepartmentNavigation() {
    return Column(
      children: [
        _buildSilverGradientButton("Reference", () {
          // Handle Service navigation
        }),
        _buildSilverGradientButton("Transaction", () {
          // Handle Doctor/Consultant navigation
        }),
        _buildSilverGradientButton("Reports", () {
          // Handle Cash Collecting Location navigation
        }),
      ],
    );
  }

  //Patients Diet Navigation
  Widget _buildInventoryDepartmentNavigation() {
    return Column(
      children: [
        _buildSilverGradientButton("Reference", () {
          // Handle Service navigation
        }),
        _buildSilverGradientButton("Master", () {
          // Handle Doctor/Consultant navigation
        }),
        _buildSilverGradientButton("Transaction", () {
          // Handle Cash Collecting Location navigation
        }),
        _buildSilverGradientButton("Reports", () {
          // Handle Cash Collecting Location navigation
        }),
        _buildSilverGradientButton("Views", () {
          // Handle Cash Collecting Location navigation
        }),
      ],
    );
  }

  //Purchase & Payables Navigation
  Widget _buildPurchaseAndPayablesDepartmentNavigation() {
    return Column(
      children: [
        _buildSilverGradientButton("Transaction", () {
          // Handle Service navigation
        }),
        _buildSilverGradientButton("Reports", () {
          // Handle Doctor/Consultant navigation
        }),
      ],
    );
  }

  //Financial Accounts Navigation
  Widget _buildFinancialAccountsDepartmentNavigation() {
    return Column(
      children: [
        _buildSilverGradientButton("Reference", () {
          // Handle Service navigation
        }),
        _buildSilverGradientButton("Master", () {
          // Handle Doctor/Consultant navigation
        }),
        _buildSilverGradientButton("Transaction", () {
          // Handle Doctor/Consultant navigation
        }),
        _buildSilverGradientButton("Process", () {
          // Handle Doctor/Consultant navigation
        }),
        _buildSilverGradientButton("Voucher Integration", () {
          // Handle Doctor/Consultant navigation
        }),
        _buildSilverGradientButton("Reports", () {
          // Handle Doctor/Consultant navigation
        }),
      ],
    );
  }

  //Financial Accounts Navigation
  Widget _buildCWSDepartmentNavigation() {
    return Column(
      children: [
        _buildSilverGradientButton("Transaction", () {
          // Handle Service navigation
        }),
      ],
    );
  }

  //Pharmacy Navigation
  Widget _buildPharmacyDepartmentNavigation() {
    return Column(
      children: [
        _buildSilverGradientButton("Master", () {
          // Handle Service navigation
        }),
        _buildSilverGradientButton("Transaction", () {
          // Handle Service navigation
        }),
        _buildSilverGradientButton("Report", () {
          // Handle Service navigation
        }),
      ],
    );
  }

  //Pharmacy Navigation
  Widget _buildEquipmentMaintenanceDepartmentNavigation() {
    return Column(
      children: [
        _buildSilverGradientButton("Reference", () {
          // Handle Service navigation
        }),
        _buildSilverGradientButton("Master", () {
          // Handle Service navigation
        }),
        _buildSilverGradientButton("Transaction", () {
          // Handle Service navigation
        }),
        _buildSilverGradientButton("Report", () {
          // Handle Service navigation
        }),
      ],
    );
  }

  //Patient History Navigation
  Widget _buildPatientHistoryDepartmentNavigation() {
    return Column(
      children: [
        _buildSilverGradientButton("Patient History", () {
          // Handle Service navigation
        }),
      ],
    );
  }

  Widget _buildSilverGradientButton(String label, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 8.0), // Increased vertical space between buttons
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, // Set text color to white for contrast
          backgroundColor:
              Colors.transparent, // Transparent background for gradient
          padding: const EdgeInsets.symmetric(
              horizontal: 30.0, vertical: 14.0), // Adjusted padding
          textStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            letterSpacing:
                1.2, // Slightly increased letter spacing for modern look
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                30.0), // Rounded corners for a polished look
          ),
          elevation: 3.0, // Reduced elevation for very light shadow effect
          shadowColor: Colors.black.withOpacity(0.1), // Very light shadow color
        ),
        onPressed: onPressed,
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors
                    .grey.shade300, // Light gray for the top part of the button
                Colors.grey
                    .shade600, // Darker gray for the bottom part of the button
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(30.0), // Rounded corners
          ),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(
                horizontal: 30.0, vertical: 14.0), // Consistent padding
            child: Text(
              label,
              style: const TextStyle(
                color:
                    Colors.black, // Text color is black for clear readability
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
