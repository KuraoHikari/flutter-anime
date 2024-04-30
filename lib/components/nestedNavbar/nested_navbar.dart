import 'package:flutter/material.dart';
import 'package:jikan_anime/models/anime.dart';

import 'material_design_indicator.dart';

class NestedTabBar extends StatefulWidget {
  const NestedTabBar({Key? key, required this.anime}) : super(key: key);

  final AnimeModel anime;

  @override
  _NestedTabBarState createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _selectedColor = Colors.transparent;

  final _tabs = [
    Tab(text: 'Detail'),
    Tab(text: 'Synopsis'),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
          Container(
            height: 600,
            padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
            decoration: BoxDecoration(
              color: _selectedColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0)),
            ),
            child: Column(
              children: [
                TabBar(
                  dividerColor: Colors.green,
                  indicatorColor: Colors.white,
                  controller: _tabController,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0)),
                      color: Colors.transparent),
                  labelColor: Colors.green,
                  unselectedLabelColor: Colors.grey,
                  tabs: _tabs,
                ),
                Container(
                  height: 500,
                  child: TabBarView(
                    controller: _tabController,
                    children: _tabs.map((Tab tab) {
                      return Center(
                        child: Text(
                          tab.text == "Synopsis"
                              ? widget.anime.synopsis ?? ""
                              : "",
                          style: TextStyle(color: Colors.white),
                        ),
                      ); // Replace this with your actual content
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
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
