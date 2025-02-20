import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:painter_app_flutter/shapes_crossfade_child.dart';

typedef ColorFunction = void Function(Color);

class ColorMenuWidget extends StatelessWidget {
  final double width;
  final double height;
  final MyFunction onPressed;
  const ColorMenuWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.15,
      height: height * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onPressed,
            child: const Icon(
              FontAwesomeIcons.palette,
              size: 27,
              color: Colors.white
            ),
          ),
          const Text(
            'Color',
            style: TextStyle(fontSize: 9, fontWeight: FontWeight.w400, color: Colors.white),
          )
        ],
      ),
    );
  }
}

// class ColorCrossfadeSecondChild extends StatelessWidget {
//   final double width;
//   final double height;
//   final ColorFunction onPressed;
//   const ColorCrossfadeSecondChild(
//       {super.key,
//       required this.height,
//       required this.width,
//       required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width * 0.15,
//       height: height * 0.15,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           GestureDetector(
//             onTap: () {
//               onPressed(Colors.red);
//             },
//             child: const Icon(
//               Icons.circle,
//               size: 30,
//               color: Colors.red,
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               onPressed(Colors.black);
//             },
//             child: const Icon(
//               Icons.circle,
//               size: 30,
//               color: Colors.black,
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               onPressed(Colors.blue);
//             },
//             child: const Icon(
//               Icons.circle,
//               size: 30,
//               color: Colors.blue,
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               onPressed(Colors.amber);
//             },
//             child: const Icon(
//               Icons.circle,
//               size: 30,
//               color: Colors.amber,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
