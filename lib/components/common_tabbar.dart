import 'package:flutter/material.dart';
import 'package:zydex_hr/util/app_color_constants.dart';
import 'package:zydex_hr/util/app_constants.dart';

class CommonTabbar extends StatefulWidget {
  final Widget? title;
  final double? toolbarHeight;
  final List<Widget> tabs;
  final Widget tabBarView;
  final int length;
  final bool isLoading;
  const CommonTabbar({
    super.key,
    this.title,
    required this.tabs,
    required this.tabBarView,
    this.toolbarHeight,
    this.length = 2,
    this.isLoading = false,
  });

  @override
  State<CommonTabbar> createState() => _CommonTabbarState();
}

class _CommonTabbarState extends State<CommonTabbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.length,
      child: Scaffold(
        backgroundColor: AppColorConstants.baseBG,
        body: NestedScrollView(
          physics:
              widget.isLoading ? const NeverScrollableScrollPhysics() : null,
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverSafeArea(
                  top: false,
                  sliver: SliverAppBar(
                    backgroundColor: AppColorConstants.baseBG,
                    scrolledUnderElevation: 0,
                    floating: true,
                    snap: true,
                    pinned: true,
                    centerTitle: false,
                    toolbarHeight: widget.toolbarHeight ?? kToolbarHeight,
                    title: widget.title,
                    bottom: TabBar(
                        indicatorWeight: 4,
                        isScrollable: false,
                        splashFactory: NoSplash.splashFactory,
                        automaticIndicatorColorAdjustment: true,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: AppColorConstants.blue100,
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: AppColorConstants.black,
                        labelStyle: const TextStyle(
                            fontFamily: AppConstants.fontFamaliyNormal,
                            color: AppColorConstants.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        tabs: widget.tabs),
                  ),
                ),
              )
            ];
          },
          body: widget.tabBarView,
        ),
      ),
    );
  }
}
