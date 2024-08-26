// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class GridIcons extends StatefulWidget {
  const GridIcons({
    super.key,
    this.width,
    this.height,
    this.selectedIcon,
  });

  final double? width;
  final double? height;
  final Future Function(String iconName)? selectedIcon;

  @override
  State<GridIcons> createState() => _GridIconsState();
}

class _GridIconsState extends State<GridIcons> {
  List<IconData> icons = [];

  @override
  void initState() {
    for (var icon in IconsUtil.getAll()) {
      icons.add(icon);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
        height: widget.height,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
          ),
          itemCount: icons.length,
          itemBuilder: (BuildContext context, int index) {
            return IconButton(
              icon: Icon(icons[index]),
              onPressed: () {
                widget.selectedIcon!(IconsUtil.getIconName(icons[index]));
              },
            );
          },
        ));
  }
}

class IconsUtil {
  static var iconsMap = {
    'network_wifi': Icons.network_wifi,
    'pets': Icons.pets,
    'drive_eta': Icons.drive_eta,
    'accessibility': Icons.accessibility,
    'home': Icons.home,
    'phone': Icons.phone,
    'email': Icons.email,
    'camera_alt': Icons.camera_alt,
    'search': Icons.search,
    'favorite': Icons.favorite,
    'location_on': Icons.location_on,
    'star': Icons.star,
    'shopping_cart': Icons.shopping_cart,
    'account_circle': Icons.account_circle,
    'build': Icons.build,
    'event': Icons.event,
    'face': Icons.face,
    'lightbulb_outline': Icons.lightbulb_outline,
    'music_note': Icons.music_note,
    'school': Icons.school,
    'settings': Icons.settings,
    'thumb_up': Icons.thumb_up,
  };

  static getByName(String iconName) {
    return iconsMap[iconName] ?? Icons.error;
  }

  static List<IconData> getAll() {
    return iconsMap.values.toList();
  }

  static String getIconName(IconData icon) {
    String iconName = 'unknown';
    if (iconsMap.containsValue(icon)) {
      iconsMap.forEach(
        (key, value) {
          if (value == icon) {
            iconName = key;
          }
        },
      );
    }
    return iconName;
  }
}
