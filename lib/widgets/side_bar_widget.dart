import 'package:flutter/material.dart';

class SideBarWidget extends StatefulWidget {
  const SideBarWidget({
    super.key,
  });

  @override
  State<SideBarWidget> createState() => _SideBarWidgetState();
}

class _SideBarWidgetState extends State<SideBarWidget> {
  // Map<String, IconData> icons = {
  //   'Home': Icons.home,
  //   'Category': Icons.category,
  //   'History': Icons.history,
  //   'Test': Icons.star_border_outlined,
  //   'Settings': Icons.settings,
  //   'About': Icons.info,
  // };

  // Map<String, bool> selected = {
  //   'Home': false,
  //   'Category': false,
  //   'History': false,
  //   'Test': false,
  //   'Settings': false,
  //   'About': false,
  // };
  Map<String, Map<String, dynamic>> menuItems = {
    'Home': {'icon': Icons.home, 'selected': false},
    'Category': {'icon': Icons.category, 'selected': false},
    'History': {'icon': Icons.history, 'selected': false},
    'Test': {'icon': Icons.star_border_outlined, 'selected': false},
    'Settings': {'icon': Icons.settings, 'selected': false},
    'About': {'icon': Icons.info, 'selected': false},
  };
  // Icon icon = const Icon(Icons.star_border_outlined);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: menuItems.length,
      itemBuilder: (BuildContext context, int index) {
        final item = menuItems.keys.elementAt(index);
        final icon = menuItems[item]!['icon'];
        final selected = menuItems[item]!['selected'];
        return ListTile(
          leading: Icon(icon, color: selected ? Colors.yellow : null),
          title: Text(item,
              style: TextStyle(color: selected ? Colors.yellow : null)),
          onTap: () {
            setState(() {
              menuItems.forEach((key, value) {
                if (key == item) {
                  value['selected'] = true;
                } else {
                  value['selected'] = false;
                }
              });
            });
            Navigator.pushNamed(context, item);
          },
        );
      },
    );
  }
}
