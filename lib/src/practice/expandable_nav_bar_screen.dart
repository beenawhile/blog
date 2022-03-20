import 'dart:ui';

import 'package:flutter/material.dart';

const _cardColor = Color(0xFF5F40FB);
const _maxHeight = 350.0;
const _minHeight = 70.0;

class ExpandableNavBarScreen extends StatefulWidget {
  const ExpandableNavBarScreen({Key? key}) : super(key: key);

  @override
  State<ExpandableNavBarScreen> createState() => _ExpandableNavBarScreenState();
}

class _ExpandableNavBarScreenState extends State<ExpandableNavBarScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final menuWidth = size.width * 0.5;
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.primaries[index % Colors.primaries.length],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
            if (_isExpanded) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final value = _controller.value;
                return Stack(
                  children: [
                    Positioned(
                      height: lerpDouble(_minHeight, _maxHeight, value),
                      bottom: lerpDouble(40, 0, value),
                      left:
                          lerpDouble(size.width / 2 - menuWidth / 2, 0, value),
                      width: lerpDouble(menuWidth, size.width, value),
                      child: Container(
                        decoration: BoxDecoration(
                          color: _cardColor,
                          borderRadius: BorderRadius.vertical(
                            top: const Radius.circular(20),
                            bottom: Radius.circular(lerpDouble(20, 0, value)!),
                          ),
                        ),
                        child: _isExpanded
                            ? const ExpandedContent()
                            : const MenuContent(),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class ExpandedContent extends StatelessWidget {
  const ExpandedContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            color: Colors.black,
            height: 80,
            width: 80,
          ),
          const SizedBox(height: 15),
          const Text(
            'Last Century',
            style: TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 15),
          const Text(
            'Bloody Tear',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.shuffle),
              Icon(Icons.pause),
              Icon(Icons.playlist_add),
            ],
          ),
        ],
      ),
    );
  }
}

class MenuContent extends StatelessWidget {
  const MenuContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Icon(Icons.calendar_today_sharp),
        Icon(Icons.calendar_today),
        Icon(Icons.calendar_today_sharp),
      ],
    );
  }
}
