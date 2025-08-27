import 'package:flutter_hms_dashboard_ui/features/departments/models/departments.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hms_dashboard_ui/core/enums/screen_size.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/departments_data.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/departments_layout.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/views/widgets/departments_list_item.dart';
import 'package:flutter_hms_dashboard_ui/features/departments/views/widgets/departments_list_item_wrapper.dart';

class DepartmentsPage extends StatefulWidget {
  const DepartmentsPage({Key? key}) : super(key: key);

  @override
  State<DepartmentsPage> createState() => _DepartmentsPageState();
}

class _DepartmentsPageState extends State<DepartmentsPage> {
  final ValueNotifier<ScrollDirection> scrollDirectionNotifier =
      ValueNotifier<ScrollDirection>(ScrollDirection.forward);

  TextEditingController searchController = TextEditingController();
  List<Department> filteredDepartments = DepartmentsData.Menu;

  @override
  void initState() {
    super.initState();
    searchController.addListener(_filterDepartments);
  }

  void _filterDepartments() {
    final query = searchController.text.toLowerCase();
    setState(() {
      // Filter departments based on title matching the query
      filteredDepartments = DepartmentsData.Menu.where((department) {
        return department.title.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.removeListener(_filterDepartments);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Departments'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 250,
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Search Departments',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
        ],
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (UserScrollNotification notification) {
          if (notification.direction == ScrollDirection.forward ||
              notification.direction == ScrollDirection.reverse) {
            scrollDirectionNotifier.value = notification.direction;
          }
          return true;
        },
        child: GridView.builder(
          padding: EdgeInsets.only(
            left: ScreenSize.of(context).isLarge ? 3 : 1.5,
            right: ScreenSize.of(context).isLarge ? 3 : 1.5,
            top: 10,
            bottom: MediaQuery.of(context).padding.bottom + 20,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //
            //
            crossAxisCount: DepartmentsLayout.of(context).gridCrossAxisCount,
            childAspectRatio:
                DepartmentsLayout.of(context).gridChildAspectRatio * 1.7,
          ),
          itemCount: filteredDepartments.length, // Use filtered list
          cacheExtent: 0,
          itemBuilder: (context, i) {
            return ValueListenableBuilder(
              valueListenable: scrollDirectionNotifier,
              child: DepartmentListItem(filteredDepartments[i]),
              builder: (context, ScrollDirection scrollDirection, child) {
                return DepartmentListItemWrapper(
                  scrollDirection: scrollDirection,
                  child: child!,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
