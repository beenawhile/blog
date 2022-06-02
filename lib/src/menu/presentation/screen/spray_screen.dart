import 'package:blog/src/menu/presentation/touch_spray.dart';
import 'package:flutter/material.dart';

class SprayScreen extends StatefulWidget {
  const SprayScreen({Key? key}) : super(key: key);

  @override
  State<SprayScreen> createState() => _SprayScreenState();
}

class _SprayScreenState extends State<SprayScreen> {
  TouchSpray? touchSpray;

  void _setNewSpray(ScaleStartDetails details) {
    touchSpray = TouchSpray(pointsList: [details.localFocalPoint]);
  }

  void _updatePointsToSpray(ScaleUpdateDetails details) {
    touchSpray!.pointsList.add(details.localFocalPoint);
  }

  void _resetSpray() {
    touchSpray = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Theme.of(context).backgroundColor,
          ),
          _buildSpray(),
          _buildGestureDetector(),
        ],
      ),
    );
  }

  Widget _buildSpray() {
    if (touchSpray == null) {
      return const SizedBox();
    }

    return CustomPaint(
      painter: SprayPainter(
        pointsList: touchSpray!.pointsList,
      ),
      size: Size.infinite,
    );
  }

  Widget _buildGestureDetector() {
    return GestureDetector(
      onScaleStart: (details) {
        setState(() {
          _setNewSpray(details);
        });
      },
      onScaleUpdate: (details) {
        setState(() {
          _updatePointsToSpray(details);
        });
      },
      onScaleEnd: (details) {
        setState(() {
          _resetSpray();
        });
      },
    );
  }
}

class SprayPainter extends CustomPainter {
  final List<Offset> pointsList;

  const SprayPainter({
    required this.pointsList,
  });

  static final _paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    _drawPath(canvas);
  }

  void _drawPath(Canvas canvas) {
    if (pointsList.length < 2) {
      return;
    }

    _paint.color = Colors.black;
    _paint.strokeWidth = 3;
    _paint.style = PaintingStyle.stroke;

    Path path = Path();
    path.moveTo(pointsList[0].dx, pointsList[0].dy);

    for (var i = 0; i < pointsList.length - 1; i++) {
      path.lineTo(pointsList[i].dx, pointsList[i].dy);
    }
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
