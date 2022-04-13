import 'package:blog/src/core/constants/index.dart';
import 'package:flutter/material.dart';

import 'package:blog/src/motions/presentation/widget_model/motion.dart';

class MotionCard extends StatelessWidget {
  const MotionCard({
    Key? key,
    required this.borderColor,
    required this.motion,
  }) : super(key: key);

  final Color borderColor;
  final Motion motion;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Card Tab
        Align(
          heightFactor: .9,
          alignment: Alignment.centerLeft,
          child: Container(
            height: 30,
            width: 70,
            decoration: BoxDecoration(
              color: borderColor,
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(LayoutConstant.radiusM)),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        // Card Body
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(LayoutConstant.paddingL),
            decoration: BoxDecoration(
              color: borderColor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(LayoutConstant.radiusL),
                  bottomLeft: Radius.circular(LayoutConstant.radiusL),
                  bottomRight: Radius.circular(LayoutConstant.radiusL)),
            ),

            // Card Body
            child: Container(
              padding: const EdgeInsets.all(LayoutConstant.paddingL),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(LayoutConstant.radiusM),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Row(
                    children: [
                      const Icon(
                        Icons.title,
                        size: 30,
                      ),
                      const SizedBox(width: LayoutConstant.spaceM),
                      Flexible(
                        child: Text(
                          motion.name,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    motion.description,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
