library sliver_fab;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A helper class if you want a FloatingActionButton to be pinned in the FlexibleAppBar
class SliverFab extends StatefulWidget {
  ///List of slivers placed in CustomScrollView
  final List<Widget> slivers;

  ///FloatingActionButton placed on the edge of FlexibleAppBar and rest of view
  final Widget floatingWidget;

  ///Expanded height of FlexibleAppBar
  final double expandedHeight;

  ///Number of pixels from top from which the [floatingWidget] should start shrinking.
  ///E.g. If your SliverAppBar is pinned, I would recommend this leaving as default 96.0
  ///     If you want [floatingActionButton] to shrink earlier, increase the value.
  final double topScalingEdge;

  FloatingPosition floatingPosition;

  SliverFab(
      {@required this.slivers,
      @required this.floatingWidget,
      this.expandedHeight = 256.0,
      this.topScalingEdge = 96.0,
      this.floatingPosition});

  @override
  State<StatefulWidget> createState() {
    return new SliverFabState();
  }
}

class FloatingPosition{
  double top, right, bottom, left;

  FloatingPosition({this.top, this.right, this.bottom, this.left});
}

class SliverFabState extends State<SliverFab> {
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
    scrollController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new CustomScrollView(
          controller: scrollController,
          slivers: widget.slivers,
        ),
        _buildFab(),
      ],
    );
  }

  Widget _buildFab() {
    final topMarginAdjustVal = Theme.of(context).platform == TargetPlatform.iOS ? 12.0 : -4.0;
    final double defaultTopMargin = widget.expandedHeight + topMarginAdjustVal;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (scrollController.hasClients) {
      double offset = scrollController.offset;
      top -= offset > 0 ? offset : 0;
      if (offset < defaultTopMargin - widget.topScalingEdge) {
        scale = 1.0;
      } else if (offset < defaultTopMargin - widget.topScalingEdge / 2) {
        scale = (defaultTopMargin - widget.topScalingEdge / 2 - offset) /
            (widget.topScalingEdge / 2);
      } else {
        scale = 0.0;
      }
    }

    double right = null;
    double bottom = null;
    double left = null;

    if(widget.floatingPosition != null){
      if(widget.floatingPosition.top != null){
        top = (top-widget.floatingPosition.top);
      }
      if(widget.floatingPosition.right != null){
        right = widget.floatingPosition.right;
      }
      if(widget.floatingPosition.bottom != null){
        bottom = widget.floatingPosition.bottom;
      }
      if(widget.floatingPosition.left != null){
        left = widget.floatingPosition.left;
      }
    }

    return new Positioned(
      top: top,
      right: right,
      bottom: bottom,
      left: left,
      child: new Transform(
        transform: new Matrix4.identity()..scale(scale, scale),
        alignment: Alignment.center,
        child: widget.floatingWidget,
      ),
    );
  }
}
