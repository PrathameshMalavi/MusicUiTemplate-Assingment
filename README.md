# music_app_ui

A Music Ui Implementation Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

# Music App UI

## Overview
The Music App UI is a single-page application designed using Flutter. It includes a dynamic banner that transforms into an app bar on scrolling, a menu button that triggers a bottom sheet navigation, and a user search functionality for the current playlist.

## Project Structure

```
lib
├── model
│   └── Album.dart
├── repository
│   ├── User.dart
│   └── data.dart
├── screens
│   └── homeUi.dart
└── widgets
    ├── dynamicAppBar.dart
    ├── otherWidgets.dart
    └── searchBar.dart
main.dart
```

### Detailed Breakdown

- **lib/model/Album.dart**: Contains the data model for an album.
- **lib/repository/User.dart**: Contains the data model for a user.
- **lib/repository/data.dart**: Includes sample data or data fetching logic.
- **lib/screens/homeUi.dart**: Defines the main user interface of the app.
- **lib/widgets/dynamicAppBar.dart**: Manages the dynamic app bar behavior.
- **lib/widgets/otherWidgets.dart**: Contains additional widgets for various UI components.
- **lib/widgets/searchBar.dart**: Handles the user search functionality.
- **main.dart**: The entry point of the application.

## Components Description

### Dynamic Banner to App Bar

The banner on the main screen transforms into an app bar as the user scrolls down. This functionality is handled by the `DynamicAppBar` widget located in `lib/widgets/dynamicAppBar.dart`.

### Bottom Sheet Navigation

A menu button is present in the app bar, which, when pressed, opens a bottom sheet navigation menu. This is implemented within the `homeUi.dart` file.

### Search Users Functionality

The search functionality allows users to search for other users in the current playlist. This is handled by the `SearchBar` widget located in `lib/widgets/searchBar.dart`.


## Assets

Assets are defined in the `pubspec.yaml` file under the `assets` section. This includes images and icons used in the application.

```yaml
assets:
  - assets/data/banner.png
  - assets/data/user.png
  - assets/icons/arrow_left_3_x2.svg
  - assets/icons/dislike_3_x2.svg
  - assets/icons/logout_x2.svg
  - assets/icons/private_1_x2.svg
  - assets/icons/search_normal_1_x2.svg
  - assets/icons/share_normal_1_x2.svg
  - assets/icons/trash_1_x2.svg
  - assets/icons/link_x2.svg
  - assets/icons/user_add_x2.svg
  - assets/icons/user_add_1_2_x2.svg
```

## Dependencies

The application uses several dependencies, which are listed in the `pubspec.yaml` file. Key dependencies include:

- `flutter`: The Flutter framework.
- `cupertino_icons`: For iOS style icons.
- `google_fonts`: To use Google Fonts in the app.
- `flutter_svg`: To use SVG images.
- `flutter_statusbarcolor_ns`: For managing status bar color.
- `toggle_switch`: For creating toggle switches.
- `readmore`: For expandable text widgets.

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  google_fonts: ^4.0.3
  flutter_svg: ^2.0.10+1
  flutter_statusbarcolor_ns: ^0.5.0
  toggle_switch: ^2.3.0
  readmore: ^3.0.0
```

## Conclusion

This documentation provides an overview of the Music App UI's structure and functionality. Each component is designed to offer a seamless and intuitive user experience, from dynamic UI elements to efficient data handling. For further customization and enhancement, developers can explore the detailed implementation in each file and make necessary modifications as per the requirements.
## Outputs

<div align="center">
<div style="padding: 10px; border: 1px solid #ddd; border-radius: 5px;">
  <h3>AppBarScreen</h3>
  <img src="https://github.com/PrathameshMalavi/MusicUiTemplate-Assingment/assets/114830029/cf6101bb-5351-458a-9b51-8f465121051e" alt="Rocket List" width="200" style="max-width: 50%;">
</div>

<div style="padding: 10px; border: 1px solid #ddd; border-radius: 5px;">
  <h3>Main Banner Screen</h3>
  <img src="https://github.com/PrathameshMalavi/MusicUiTemplate-Assingment/assets/114830029/f6ca4851-2432-4c66-a21c-52cb92056065" alt="Rocket Details" width="200" style="max-width: 50%;">
</div>
</div>
<div align="center">
<div style="padding: 10px; border: 1px solid #ddd; border-radius: 5px;">
  <h3>Search Screen</h3>
  <img src="https://github.com/PrathameshMalavi/MusicUiTemplate-Assingment/assets/114830029/20668c71-aaab-4a98-8c3d-3a60a87e4c28" alt="About SpaceX" width="200" style="max-width: 50%;">
</div>

<div style="padding: 10px; border: 1px solid #ddd; border-radius: 5px;">
  <h3>Bottom Navigation Sheet Screen</h3>
  <img src="https://github.com/PrathameshMalavi/MusicUiTemplate-Assingment/assets/114830029/852c266d-6f80-4ed7-b7e8-ad34452b1267" alt="About Developer" width="200" style="max-width: 50%;">
</div>
</div>




