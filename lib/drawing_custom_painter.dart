import 'package:flutter/material.dart';

class DrawingCustomPainter extends CustomPainter {
  final List<List<Offset>> listOfListOffsetOfAllPreviousDrawing;
  final List<Offset> listOfCurrentDrawingOffset;
  final List<Color> listOfPreviousColor;
  final List<double> listOfPreviousStrokeWidth;
  final Color selectedColor;
  final double selectedStrokeWidth;
  final String shape;
  final List<String> listOfAllShape;
  final Offset onPanStartOffset;
  final Offset onPanEndOffset;
  final bool isCustomPainterRebuild;

  DrawingCustomPainter(
      {required this.listOfListOffsetOfAllPreviousDrawing,
      required this.listOfCurrentDrawingOffset,
      required this.listOfPreviousColor,
      required this.listOfPreviousStrokeWidth,
      required this.shape,
      required this.listOfAllShape,
      required this.onPanStartOffset,
      required this.onPanEndOffset,
      required this.isCustomPainterRebuild,
      this.selectedColor = Colors.black,
      this.selectedStrokeWidth = 5.0});

  List<Paint> listOfPreviousDrawingPaint = [];

  @override
  void paint(Canvas canvas, Size size) {
    final Size(:width, :height) = size;

    // Paint
    Paint currentDrawingPaint = Paint()
      ..color = selectedColor
      ..strokeWidth = selectedStrokeWidth
      ..style = PaintingStyle.stroke;

    //Draw previously line drawed by user
    for (var i = 0; i < listOfListOffsetOfAllPreviousDrawing.length; i++) {
      List<Offset> listOfPreviousDrawingStartAndEndOffset =
          listOfListOffsetOfAllPreviousDrawing[i];
      listOfPreviousDrawingPaint.add(Paint()
        ..color = listOfPreviousColor[i]
        ..strokeWidth = listOfPreviousStrokeWidth[i]
        ..style = PaintingStyle.stroke);
      for (var j = 0;
          j < listOfPreviousDrawingStartAndEndOffset.length - 1;
          j++) {
        if (listOfAllShape[i] == 'line') {
          canvas.drawLine(
              listOfPreviousDrawingStartAndEndOffset[j],
              listOfPreviousDrawingStartAndEndOffset[j + 1],
              listOfPreviousDrawingPaint[i]);
        } else if (listOfAllShape[i] == 'rectangle') {
          Rect rect = Rect.fromPoints(listOfPreviousDrawingStartAndEndOffset[j],
              listOfPreviousDrawingStartAndEndOffset[j + 1]);
          canvas.drawRect(rect, listOfPreviousDrawingPaint[i]);
        } else if (listOfAllShape[i] == 'circle') {
          Rect rect = Rect.fromPoints(listOfPreviousDrawingStartAndEndOffset[j],
              listOfPreviousDrawingStartAndEndOffset[j + 1]);
          canvas.drawOval(rect, listOfPreviousDrawingPaint[i]);
        }
      }
    }

    // Draw current line when user draging finger
    for (var i = 0; i < listOfCurrentDrawingOffset.length - 1; i++) {
      if (shape == 'line') {
        canvas.drawLine(listOfCurrentDrawingOffset[i],
            listOfCurrentDrawingOffset[i + 1], currentDrawingPaint);
      }
    }

    // Draw current shape when user draging finger
    if (isCustomPainterRebuild && listOfListOffsetOfAllPreviousDrawing.isNotEmpty) {
      Rect rect = Rect.fromPoints(onPanStartOffset, onPanEndOffset);
      if (shape == 'rectangle') {
        canvas.drawRect(rect, currentDrawingPaint);
      } else if (shape == 'circle') {
        canvas.drawOval(rect, currentDrawingPaint);
      }
    }
  }

  @override
  bool shouldRepaint(DrawingCustomPainter oldDelegate) =>
      isRepaint(oldDelegate);

  @override
  bool shouldRebuildSemantics(DrawingCustomPainter oldDelegate) =>
      isRepaint(oldDelegate);

  bool isRepaint(DrawingCustomPainter oldDelagate) => isCustomPainterRebuild;
}
