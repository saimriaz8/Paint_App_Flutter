import 'package:flutter/material.dart';

typedef MyFunction = void Function();
typedef ShapesFunction = void Function(String);

class ShapeMenuWidget extends StatelessWidget {
  final double width;
  final double height;
  final MyFunction onPressed;
  const ShapeMenuWidget(
      {super.key,
      required this.height,
      required this.width,
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
              Icons.square_outlined,
              size: 28,
              color: Colors.white
            ),
          ),
          const Text(
            'Shapes',
            style: TextStyle(fontSize: 9, fontWeight: FontWeight.w400, color: Colors.white),
          )
        ],
      ),
    );
  }
}

// class ShapesCrossfadeSecondChild extends StatelessWidget {
//   final double width;
//   final double height;
//   final ShapesFunction onPressed;
//   const ShapesCrossfadeSecondChild(
//       {super.key, required this.height, required this.width, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width * 0.15,
//       height: height * 0.15,
//       child:  Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             GestureDetector(
//               onTap: () => onPressed('square'),
//               child: const Icon(
//                 Icons.square_outlined,
//                 size: 40,
//                 color: Colors.black,
//               ),
//             ),
//             GestureDetector(
//               onTap: () => onPressed('rectangle'),
//               child: const Icon(
//                 Icons.rectangle_outlined,
//                 size: 40,
//                 color: Colors.black,
//               ),
//             ),
//             GestureDetector(
//               onTap: () => onPressed('circle'),
//               child: const Icon(
//                 Icons.circle_outlined,
//                 size: 40,
//                 color: Colors.black,
//               ),
//             ),
//           ]),
//     );
//   }
// }
