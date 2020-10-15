import 'package:flutter/material.dart';

class GameVideoHeader extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final TabController tabController;
  final List<Tab> tabs;
  final Widget view;

  const GameVideoHeader({
    Key key,
    @required this.tabController,
    @required this.tabs,
    @required this.view,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context),
      child: SafeArea(
        child: Column(
          children: [
            view ?? Container(),
            tabs == null || tabs.isEmpty
                ? Container()
                : Container(
                    height: 48,
                    child: TabBar(
                      controller: tabController,
                      tabs: tabs,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}
