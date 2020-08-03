import 'package:flutter/material.dart';

/// 创建时间：2020/8/3 
/// 作者：Dawn
class NestTabBarViewItem extends StatelessWidget {
  final String tabName;
  final Widget item;

  NestTabBarViewItem( this.tabName, this.item,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        // This Builder is needed to provide a BuildContext that is
        // "inside" the NestedScrollView, so that
        // sliverOverlapAbsorberHandleFor() can find the
        // NestedScrollView.
        builder: (BuildContext context) {
          return CustomScrollView(
            // The "controller" and "primary" members should be left
            // unset, so that the NestedScrollView can control this
            // inner scroll view.
            // If the "controller" property is set, then this scroll
            // view will not be associated with the NestedScrollView.
            // The PageStorageKey should be unique to this ScrollView;
            // it allows the list to remember its scroll position when
            // the tab view is not on the screen.
            key: PageStorageKey<String>(tabName),
            slivers: <Widget>[
              SliverOverlapInjector(
                // This is the flip side of the SliverOverlapAbsorber
                // above.
                handle:
                NestedScrollView.sliverOverlapAbsorberHandleFor(
                    context),
              ),
              item
            ],
          );
        },
      ),
    );
  }
}
