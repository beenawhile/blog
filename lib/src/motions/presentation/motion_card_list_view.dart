import 'package:flutter/material.dart';

import 'package:blog/src/motions/presentation/widget_model/motion.dart';

class MotionCardListView extends StatefulWidget {
  const MotionCardListView({
    Key? key,
    required this.children,
    required this.itemExtent,
    this.initialIndex = 0,
    this.visualizedItems = 9,
    this.padding = const EdgeInsets.all(0),
    this.onTapFrontItem,
    this.onChangeItem,
    this.backItemsShadowColor = Colors.transparent,
  }) : super(key: key);

  final List<Widget> children;
  final double itemExtent;
  final int initialIndex;
  final int visualizedItems;
  final EdgeInsetsGeometry padding;
  final ValueChanged<int>? onTapFrontItem;
  final ValueChanged<int>? onChangeItem;
  final Color backItemsShadowColor;

  @override
  State<MotionCardListView> createState() => _MotionCardListViewState();
}

class _MotionCardListViewState extends State<MotionCardListView> {
  late PageController _pageController;
  late double _pagePercent;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.initialIndex,
      viewportFraction: 1 / widget.visualizedItems,
    );

    _currentIndex = widget.initialIndex;
    _pagePercent = 0.0;
    _pageController.addListener(_pageListener);
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }

  void _pageListener() {
    _currentIndex = _pageController.page!.floor();
    _pagePercent = (_pageController.page! - _currentIndex).abs();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        final height = constraints.maxHeight;
        return Stack(
          children: [
            // Perspective Items
            Padding(
              padding: widget.padding,
              child: Container(
                color: Colors.red,
                child: _PerspectiveItems(
                  generateItems: widget.visualizedItems - 1,
                  currentIndex: _currentIndex,
                  children: widget.children,
                  pagePercent: _pagePercent,
                ),
              ),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    widget.backItemsShadowColor.withOpacity(.4),
                    widget.backItemsShadowColor.withOpacity(.0),
                  ],
                )),
              ),
            ),
            PageView.builder(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (value) {
                if (widget.onChangeItem != null) {
                  widget.onChangeItem?.call(value);
                }
              },
              itemBuilder: (context, index) {
                return const SizedBox();
              },
              itemCount: motions.length,
            ),
            // On tap item area
            Positioned.fill(
              top: height - widget.itemExtent,
              child: GestureDetector(
                onHorizontalDragCancel: () {
                  if (widget.onTapFrontItem != null) {
                    widget.onTapFrontItem?.call(_currentIndex);
                  }
                },
                child: Container(color: Colors.yellow),
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _PerspectiveItems extends StatelessWidget {
  const _PerspectiveItems({
    Key? key,
    required this.generateItems,
    required this.currentIndex,
    required this.pagePercent,
    required this.children,
  }) : super(key: key);

  final int generateItems;
  final int currentIndex;
  final double pagePercent;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          fit: StackFit.expand,
          children: List.generate(
            generateItems,
            (index) {
              final invertedIndex = (generateItems - 2) - index;
              // final indexPlus = index + 1;
              // final positionPercent = indexPlus / generateItems;
              // final endPositionPercent = index / generateItems;
              return (currentIndex > invertedIndex)
                  ? const SizedBox()
                  : const SizedBox();
            },
          ),
        );
      },
    );
  }
}

// class _TransformedItem extends StatelessWidget {
//   const _TransformedItem({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
