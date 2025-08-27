HMS Dashboard - Animated UI
A modern and interactive Hospital Management System (HMS) dashboard built with Flutter, featuring smooth animations and a comprehensive department management interface.

[alt text](assets/images/flutter_hms_dashboard_ui_1.png) 
[alt text](assets/images/flutter_hms_dashboard_ui_2.png)
[alt text](assets/images/flutter_hms_dashboard_ui_3.png)

✨ Features
Smooth Animations: Beautifully animated UI transitions for hospital department navigation

Comprehensive Departments: 30+ healthcare departments including General, OPD, ER, Radiology, and more

Interactive Design: Sensor integration for device orientation-based animations

Robust State Management: Built with flutter_riverpod for efficient state handling

Customizable Theme: Consistent theming with AppColors for a polished professional look

Extensible Architecture: Easy to add custom departments or modify UI animations

🏥 Department Categories
The dashboard includes these essential hospital departments:

Clinical Services: General, OPD, ER, Radiology, IPD, Lab

Patient Services: Patients Diet, Patient History, Medical Records

Administrative: Administration, Billing, Financial Accounts, Purchase & Payables

Specialized Systems: Pharmacy, Dialysis System, Security Systems, Equipment Maintenance

Support Systems: Inventory, CWS, Library Management, Donation System, Marketing

🚀 Installation
Add dependencies to your pubspec.yaml:

yaml
dependencies:
  sensors_plus: ^6.1.2
  flutter_riverpod: ^2.6.1
Install the packages:

bash
flutter pub get
Import the necessary files:

dart
import 'package:flutter_hms_dashboard_ui/features/departments/models/departments.dart';
import 'package:flutter_hms_dashboard_ui/core/styles/app_colors.dart';
💻 Usage
Basic Implementation
dart
// Access department data
final departments = DepartmentsData.Menu;

// Example department structure
Department(
  id: 1,
  title: 'General',
  image: 'assets/images/departments_icons/16-General.png',
  bgColor: Color.fromARGB(255, 238, 152, 94),
),
State Management with Riverpod
dart
final departmentProvider = StateProvider<Department>((ref) {
  return DepartmentsData.Menu.first;
});
Sensor Integration
dart
// Use sensors_plus for animation triggers based on device orientation
accelerometerEvents.listen((AccelerometerEvent event) {
  // Trigger animations based on device movement
});
🎨 Customization
Adding New Departments
Extend the DepartmentsData class to include new hospital departments:

dart
class CustomDepartments {
  static final List<Department> additionalDepartments = [
    Department(
      id: 31,
      title: 'New Department',
      image: 'assets/images/new_icon.png',
      bgColor: AppColors.primary,
    ),
  ];
}
Modifying Colors and Themes
Update AppColors to match your hospital's branding:

dart
class AppColors {
  static const Color primary = Color(0xFF2A7FBA);
  static const Color secondary = Color(0xFF4CAF50);
  static const Color accent = Color(0xFFFF9800);
  // Add more color variables as needed
}
📱 Department Icons
Ensure you have the following icon structure in your assets:

text
assets/
  images/
    departments_icons/
      1-General.png
      2-OPD.png
      3-ER.png
      # ... and so on for all departments
🤝 Contributing
We welcome contributions to enhance this HMS Dashboard!

Fork the repository

Create your feature branch (git checkout -b feature/AmazingFeature)

Commit your changes (git commit -m 'Add some AmazingFeature')

Push to the branch (git push origin feature/AmazingFeature)

Open a Pull Request

Reporting Issues
Found a bug or have a suggestion? Please open an issue on GitHub.

📄 License
This project is licensed under the MIT License - see the LICENSE file for details.

🔗 Links
GitHub Repository: https://github.com/ARK1998/flutter_hms_dashboard_ui

Flutter Documentation: https://flutter.dev

Riverpod Documentation: https://riverpod.dev

📞 Support: +966593814435
If you have any questions or need help with implementation, please:

Check the Flutter documentation

Look through existing GitHub issues

Create a new issue if your problem hasn't been addressed

Built with ❤️ for the healthcare community using Flutter
