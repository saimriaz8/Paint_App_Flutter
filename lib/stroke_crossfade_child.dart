import 'package:flutter/material.dart';

typedef MyFunction = void Function();
typedef FunctionWithDoubleParameter = void Function(double);

class StrokeMenuWidget extends StatelessWidget {
  final double width;
  final double height;
  final MyFunction onPressed;
  const StrokeMenuWidget(
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
              Icons.circle,
              size: 28,
              color: Colors.white
            ),
          ),
          const Text(
            'Stroke',
            style: TextStyle(fontSize: 9, fontWeight: FontWeight.w400, color: Colors.white),
          )
        ],
      ),
    );
  }
}

// class StrokeCrossfadeSecondChild extends StatelessWidget {
//   final double width;
//   final double height;
//   final FunctionWithDoubleParameter onPressed;
//   const StrokeCrossfadeSecondChild(
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
//               onPressed(11);
//             },
//             child: const Icon(
//               Icons.circle,
//               size: 40,
//               color: Colors.black,
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               onPressed(5);
//             },
//             child: const Icon(
//               Icons.circle,
//               size: 30,
//               color: Colors.black,
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               onPressed(2);
//             },
//             child: const Icon(
//               Icons.circle,
//               size: 20,
//               color: Colors.black,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
