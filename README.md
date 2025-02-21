# Paint App - Flutter

## Overview
This is a simple drawing/painting application built using Flutter. The app allows users to draw, erase, select colors, change stroke width, and draw basic shapes like rectangles and circles.

## Features
- Draw freehand lines
- Select stroke width
- Choose different colors
- Erase parts of the drawing
- Clear the entire canvas
- Draw basic shapes (rectangles and circles)
- Save and load drawings
- Undo and redo actions

## Project Structure
```
lib/
├── main.dart                  # Entry point of the application
├── drawing_custom_painter.dart # Handles drawing on the canvas
├── color_crossfade_child.dart  # Handles color selection
├── shapes_crossfade_child.dart # Handles shape selection
├── stroke_crossfade_child.dart # Handles stroke selection
├── save_load_manager.dart      # Handles saving and loading drawings
├── undo_redo_manager.dart      # Handles undo and redo actions
```

## Getting Started
### Prerequisites
Ensure you have Flutter installed on your system. If not, install it from [Flutter's official website](https://flutter.dev/docs/get-started/install).

### Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/paint-app-flutter.git
   ```
2. Navigate to the project directory:
   ```sh
   cd paint-app-flutter
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the application:
   ```sh
   flutter run
   ```

## Usage
- **Draw**: Tap on the "Draw" button to start drawing.
- **Select Shape**: Choose between a rectangle and a circle from the shape menu.
- **Change Stroke Width**: Select different stroke thickness levels.
- **Change Color**: Choose a color from the color menu.
- **Erase**: Tap the eraser icon to erase parts of the drawing.
- **Clear Canvas**: Tap "Erase All" to clear the entire canvas.
- **Save Drawing**: Tap the save icon to store your drawing.
- **Load Drawing**: Tap the load icon to retrieve a saved drawing.
- **Undo/Redo**: Use the undo and redo buttons to revert or reapply changes.

## Dependencies
This project uses the following dependencies:
- `flutter/material.dart`
- `font_awesome_flutter`
- `path_provider`

## Author
Saim Riaz 

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## Product Video
https://github.com/user-attachments/assets/daa4a2a3-5480-4ac2-a4f4-30011f3139be

Happy Painting! 🎨

