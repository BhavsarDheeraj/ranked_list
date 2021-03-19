library ranked_list;

import 'package:flutter/material.dart';

class RankedList extends StatefulWidget {
  final int itemCount;
  final int rank;
  final double itemHeight;
  final bool showTop;
  final bool showBottom;
  final Widget topItem;
  final Widget bottomItem;
  final Widget Function(BuildContext, int) itemBuilder;

  const RankedList({
    Key key,
    @required this.itemBuilder,
    @required this.itemCount,
    @required this.rank,
    @required this.itemHeight,
    this.showTop = true,
    this.showBottom = true,
    this.topItem,
    this.bottomItem,
  }) : super(key: key);

  @override
  _RankedListState createState() => _RankedListState();
}

class _RankedListState extends State<RankedList> {
  int get itemCount => widget.itemCount;
  int get rank => widget.rank;
  double get itemHeight => widget.itemHeight;
  bool get showTop => widget.showTop;
  bool get showBottom => widget.showBottom;
  Widget get topItem => widget.topItem;
  Widget get bottomItem => widget.bottomItem;
  Widget Function(BuildContext, int) get itemBuilder => widget.itemBuilder;

  final controller = ScrollController();

  var isBottomShowing = false;
  var isTopShowing = false;

  @override
  void initState() {
    super.initState();
    _configure();
  }

  void _configure() {
    final topPos = (rank - 1) * itemHeight;
    final bottomPos = rank * itemHeight;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (bottomPos > controller.position.extentInside &&
          isBottomShowing == false) {
        setState(() {
          isBottomShowing = true;
        });
      }
    });

    controller.addListener(() {
      if (controller.position.extentInside > bottomPos) {
        return;
      }

      if (controller.position.extentBefore + controller.position.extentInside >
              bottomPos &&
          isBottomShowing) {
        setState(() {
          isBottomShowing = false;
        });
      }

      if (controller.position.extentBefore + controller.position.extentInside <
              bottomPos &&
          !isBottomShowing) {
        setState(() {
          isBottomShowing = true;
        });
      }

      if (controller.position.extentBefore > topPos && !isTopShowing) {
        setState(() {
          isTopShowing = true;
        });
      }

      if (controller.position.extentBefore < topPos && isTopShowing) {
        setState(() {
          isTopShowing = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView.builder(
              controller: controller,
              itemCount: itemCount,
              itemBuilder: itemBuilder,
            ),
            isBottomShowing && showBottom
                ? (bottomItem ?? Container())
                : Container(),
          ],
        ),
        isTopShowing && showTop ? (topItem ?? Container()) : Container(),
      ],
    );
  }
}
