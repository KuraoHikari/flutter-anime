import 'package:flutter/material.dart';

import 'material_design_indicator.dart';

class NestedTabBar extends StatefulWidget {
  const NestedTabBar({Key? key}) : super(key: key);

  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _selectedColor = Color(0xff1a73e8);
  final _unselectedColor = Color(0xff5f6368);
  final _tabs = [
    Tab(text: 'Tab1'),
    Tab(text: 'Tab2'),
    Tab(text: 'Tab3'),
  ];

  final _iconTabs = [
    Tab(icon: Icon(Icons.home)),
    Tab(icon: Icon(Icons.search)),
    Tab(icon: Icon(Icons.settings)),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ///Default Tabbar with full width tabbar indicator

          /// Custom Tabbar with solid selected bg and transparent tabbar bg
          Container(
            height: kToolbarHeight - 8.0,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: _selectedColor),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: _tabs,
            ),
          ),

          /// Custom Tabbar with solid selected bg and transparent tabbar bg
          Container(
            height: kToolbarHeight + 8.0,
            padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
            decoration: BoxDecoration(
              color: _selectedColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0)),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                  color: Colors.white),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              tabs: _tabs,
            ),
          ),
          Container(
            height: kToolbarHeight + 8.0,
            padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
            decoration: BoxDecoration(
              color: _selectedColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0)),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                  color: Colors.white),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              tabs: _tabs,
            ),
          ),
          Container(
            height: kToolbarHeight + 8.0,
            padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
            decoration: BoxDecoration(
              color: _selectedColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0)),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                  color: Colors.white),
              labelColor: Colors.black,
              unselectedLabelColor: Colors.white,
              tabs: _tabs,
            ),
          ),

          /// Custom Tabbar with transparent selected bg and solid selected text
        ]
            .map((item) => Column(
                  /// Added a divider after each item to let the tabbars have room to breathe
                  children: [
                    item,
                    Divider(
                      color: Colors.transparent,
                    )
                  ],
                ))
            .toList(),
      ),
    );
  }
}
