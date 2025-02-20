import 'package:flutter/material.dart';
import 'package:painter_app_flutter/color_crossfade_child.dart';
import 'package:painter_app_flutter/drawing_custom_painter.dart';
import 'package:painter_app_flutter/shapes_crossfade_child.dart';
import 'package:painter_app_flutter/stroke_crossfade_child.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<List<Offset>> allLines = [];
  List<Offset> currentLine = [];
  List<Color> colors = [];
  List<double> listOfStrokeWidth = [];
  CrossFadeState shapeCrossFadeState = CrossFadeState.showFirst;
  CrossFadeState strokeCrossFadeState = CrossFadeState.showFirst;
  CrossFadeState colorCrossFadeState = CrossFadeState.showFirst;
  Color selectedColor = Colors.black;
  double strokeWidth = 0.0;
  Offset panStartOffset = const Offset(0, 0);
  Offset panEndOffset = const Offset(0, 0);
  bool isCustomPainterRebuild = false;

  List<String> listOfAllShapes = [];
  String currentShape = '';

  void onPressedMainShape() {
    setState(() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Select shape'),
            backgroundColor: Colors.white,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.rectangle,
                    color: Colors.black,
                  ),
                  title: const Text('Rectangle'),
                  onTap: () {
                    onPressedShapes('rectangle');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.circle,
                    color: Colors.black,
                  ),
                  title: const Text('Circle'),
                  onTap: () {
                    onPressedShapes('circle');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    });
  }

  void onPressedShapes(String shape) {
    setState(() {
      currentShape = shape;
      if (selectedColor == Colors.white) {
        selectedColor = Colors.black;
      }
    });
  }

  void onPressedDrawIcon() {
    setState(() {
      currentShape = 'line';
      if (selectedColor == Colors.white) {
        selectedColor = Colors.black;
        strokeWidth = 5;
      }
    });
  }

  void onPressedStrokeFirst() {
    setState(() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Select stroke'),
            backgroundColor: Colors.white,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.circle,
                    color: Colors.black,
                    size: 20,
                  ),
                  title: const Text('11 dp'),
                  onTap: () {
                    onPressedStrokeWidth(11);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.circle,
                    color: Colors.black,
                    size: 14,
                  ),
                  title: const Text('6 dp'),
                  onTap: () {
                    onPressedStrokeWidth(6);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.circle,
                    color: Colors.black,
                    size: 10,
                  ),
                  title: const Text('2 dp'),
                  onTap: () {
                    onPressedStrokeWidth(2);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    });
  }

  void onPressedStrokeWidth(double strokeWidth) {
    setState(() {
      this.strokeWidth = strokeWidth;
    });
  }

  void onPressedColor(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

  void onPressedColorFirst() {
    setState(() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Select Color'),
            backgroundColor: Colors.white,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.circle,
                    color: Colors.red,
                  ),
                  title: const Text('Red'),
                  onTap: () {
                    onPressedColor(Colors.red);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.circle,
                    color: Colors.black,
                  ),
                  title: const Text('Black'),
                  onTap: () {
                    onPressedColor(Colors.black);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.circle,
                    color: Colors.yellow,
                  ),
                  title: const Text('Yellow'),
                  onTap: () {
                    onPressedColor(Colors.yellow);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.circle,
                    color: Colors.blue,
                  ),
                  title: const Text('Blue'),
                  onTap: () {
                    onPressedColor(Colors.blue);
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          );
        },
      );
    });
  }

  void onPressedEraseAll() {
    setState(() {
      allLines = [];
      isCustomPainterRebuild = true;
    });
  }

  void onPressedErase() {
    setState(() {
      selectedColor = Colors.white;
      strokeWidth = 15;
      currentShape = 'line';
    });
  }

  void onPanStart(DragStartDetails details) {
    setState(() {
      colors.add(selectedColor);
      listOfStrokeWidth.add(strokeWidth);
      listOfAllShapes.add(currentShape);
      isCustomPainterRebuild = true;
      if (currentShape == 'rectangle' || currentShape == 'circle') {
        panStartOffset = details.localPosition;
      } else {
        currentLine.add(details.localPosition);
      }
    });
  }

  void onPanUpdate(DragUpdateDetails details) {
    setState(() {
      if (currentShape == 'rectangle' || currentShape == 'circle') {
        panEndOffset = details.localPosition;
      } else {
        currentLine.add(details.localPosition);
      }
    });
  }

  void onPanEnd(DragEndDetails details) {
    setState(() {
      if (currentShape == 'rectangle' || currentShape == 'circle') {
        panEndOffset = panEndOffset;
        List<Offset> shapeOffset = [panStartOffset, panEndOffset];
        allLines.add(shapeOffset);
      } else {
        allLines.add(currentLine);
        currentLine = [];
      }
      isCustomPainterRebuild = false;
    });
  }

  List<Widget> listOfStackWidget = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final Size(:width, :height) = size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: width * 0.15,
                  height: height,
                  decoration: const BoxDecoration(
                      color: Color(0xff2F2F2F),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: onPressedDrawIcon,
                        child: SizedBox(
                          width: width * 0.15,
                          height: height * 0.15,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.draw,
                                size: 28,
                                color: Colors.white,
                              ),
                              Text(
                                'Draw',
                                style: TextStyle(
                                    fontSize: 9, fontWeight: FontWeight.w400, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      ShapeMenuWidget(
                          height: height,
                          width: width,
                          onPressed: onPressedMainShape),
                      StrokeMenuWidget(
                          height: height,
                          width: width,
                          onPressed: onPressedStrokeFirst),
                      ColorMenuWidget(
                          width: width,
                          height: height,
                          onPressed: onPressedColorFirst),
                      GestureDetector(
                        onTap: onPressedErase,
                        child: SizedBox(
                          width: width * 0.15,
                          height: height * 0.15,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.eraser,
                                size: 27,
                                color: Colors.white
                              ),
                              Text(
                                'Eraser',
                                style: TextStyle(
                                    fontSize: 9, fontWeight: FontWeight.w400, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: onPressedEraseAll,
                        child: SizedBox(
                          width: width * 0.15,
                          height: height * 0.15,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.clear,
                                size: 28,
                                color: Colors.white
                              ),
                              Text(
                                'Erase All',
                                style: TextStyle(
                                    fontSize: 9, fontWeight: FontWeight.w400, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: width * 0.85,
                  height: height,
                  color: Colors.white,
                  child: LineWidget(
                    width: width,
                    height: height,
                    onPanStart: onPanStart,
                    onPanUpdate: onPanUpdate,
                    onPanEnd: onPanEnd,
                    allLines: allLines,
                    currentLine: currentLine,
                    color: selectedColor,
                    allLineColors: colors,
                    listOfStrokeWidth: listOfStrokeWidth,
                    strokeWidth: strokeWidth,
                    currentShape: currentShape,
                    listOfAllShapes: listOfAllShapes,
                    onPanStartOffset: panStartOffset,
                    onPanEndOffset: panEndOffset,
                    isCustomPainterRebuild: isCustomPainterRebuild,
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class LineWidget extends StatelessWidget {
  final double width;
  final double height;
  final List<List<Offset>> allLines;
  final List<Offset> currentLine;
  final GestureDragStartCallback? onPanStart;
  final GestureDragUpdateCallback? onPanUpdate;
  final GestureDragEndCallback? onPanEnd;
  final Color color;
  final double strokeWidth;
  final List<Color> allLineColors;
  final List<double> listOfStrokeWidth;
  final String currentShape;
  final List<String> listOfAllShapes;
  final Offset onPanStartOffset;
  final Offset onPanEndOffset;
  final bool isCustomPainterRebuild;

  const LineWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.onPanStart,
      required this.onPanUpdate,
      required this.onPanEnd,
      required this.allLines,
      required this.currentLine,
      required this.allLineColors,
      required this.currentShape,
      required this.listOfAllShapes,
      required this.listOfStrokeWidth,
      required this.onPanStartOffset,
      required this.onPanEndOffset,
      required this.isCustomPainterRebuild,
      this.color = Colors.black,
      this.strokeWidth = 5.0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onPanStart: onPanStart,
        onPanUpdate: onPanUpdate,
        onPanEnd: onPanEnd,
        child: CustomPaint(
          painter: DrawingCustomPainter(
              selectedStrokeWidth: strokeWidth,
              shape: currentShape,
              selectedColor: color,
              listOfAllShape: listOfAllShapes,
              listOfListOffsetOfAllPreviousDrawing: allLines,
              listOfPreviousColor: allLineColors,
              listOfPreviousStrokeWidth: listOfStrokeWidth,
              listOfCurrentDrawingOffset: currentLine,
              onPanEndOffset: onPanEndOffset,
              onPanStartOffset: onPanStartOffset,
              isCustomPainterRebuild: isCustomPainterRebuild),
          size: Size(width * 0.85, height),
        ));
  }
}
