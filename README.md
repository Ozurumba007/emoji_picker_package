Emoji Picker Package Documentation

## Overview

The Emoji Picker package provides a customizable and lightweight grid of emojis that developers can easily integrate into their Flutter applications. It supports emoji categorization, searching, and styling to fit your app’s theme.

## Features

1. Categorized emoji selection (e.g., smileys, animals, symbols, etc.).
2. Built-in search bar for quick emoji filtering.
3. Fully customizable grid layout (size, spacing, colors).
4. Lightweight and efficient for all platforms (iOS, Android, Web).

## Getting started

1. Add the Dependency
Add this line to your pubspec.yaml file:

```yaml 

dependencies:
  emoji_picker: ^1.0.0
  
```

Run the following command to fetch the package: 

``` bash

  flutter pub get
  
```

## Usage

## BASIC EMOJI PICKER

```dart

import 'package:emoji_picker/emoji_picker.dart';

class EmojiPickerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Emoji Picker Example')),
      body: EmojiPicker(
        onEmojiSelected: (emoji) {
          print('Selected Emoji: ${emoji.char}');
        },
      ),
    );
  }
}

//What It Does:
//This code displays a simple emoji picker. When the user selects an emoji, it prints the emoji character to the console.

```
## Adding Custom Emoji Categories

```dart 
EmojiPicker(
  categories: [
    Category(
      name: 'Favorites',
      icon: Icons.star,
      emojis: [
        Emoji(char: '❤️', name: 'Heart'),
        Emoji(char: '😂', name: 'Laugh'),
        Emoji(char: '🔥', name: 'Fire'),
      ],
    ),
    ...EmojiPickerCategories.defaultCategories,
  ],
  onEmojiSelected: (emoji) {
    print('Selected: ${emoji.char}');
  },
);
// What It Does:
//Adds a custom Favorites category with hand-picked emojis alongside the default categories.
``` 

## Custom Styling
Customize the emoji grid to match your app’s theme:

```dart 

EmojiPicker(
  gridSpacing: 8.0,
  emojiSize: 24.0,
  backgroundColor: Colors.white,
  categoryColor: Colors.blue,
  selectedCategoryColor: Colors.red,
);

//What It Does:
//Customizes the emoji picker with larger emojis, a white background, and blue highlighting for the selected category. The grid spacing is   increased for a more spacious layout.

```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.

## About the Package
This package provides a robust and customizable Emoji Picker widget for Flutter, enabling developers to integrate emoji selection functionality into their apps effortlessly. Whether you're building a chat app, social platform, or any app requiring emojis, this package is a lightweight and flexible solution.

## Contributing
 We welcome contributions from the community! Here’s how you can get involved:

1. Fork the repository on GitHub.
2. Create a new branch for your feature or bug fix.
3. Submit a pull request with a detailed description of the changes.

    Before submitting, please ensure:

1. Your code adheres to Flutter and Dart style guidelines.
2. Tests are included for any new functionality.

## Acknowledgments
Special thanks to the Flutter community for their inspiration and contributions. If you’ve found this package helpful, please consider giving it a star on GitHub or leaving a review on pub.dev. 
