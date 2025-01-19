# Emoji Picker

The **Emoji Picker** package provides a lightweight, customizable grid of emojis for Flutter applications. Designed with flexibility and efficiency in mind, it allows developers to integrate emoji selection seamlessly into their apps, with support for categorization, custom styling, and user-defined categories.

---

## Features

- Categorized emoji selection (e.g., smileys, animals, symbols).
- Built-in options for custom emoji categories.
- Customizable grid layout (size, spacing, colors).
- Compatible with Flutter apps for iOS, Android, and Web.
- Lightweight and efficient.

---

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  emoji_picker: ^1.0.0
```

Fetch the package:

```bash
flutter pub get
```

---

## Usage

### Basic Emoji Picker

```dart
import 'package:emoji_picker/emoji_picker.dart';

class EmojiPickerExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Emoji Picker Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            EmojiPicker.pickEmoji(
              context: context,
              selectedEmoji: (emoji) {
                print('Selected Emoji: ${emoji.char}');
              },
            );
          },
          child: Text('Open Emoji Picker'),
        ),
      ),
    );
  }
}
```

### Adding Custom Emoji Categories

```dart
EmojiPicker(
  config: EmojiViewConfig(
    categories: [
      EmojiCategory(
        name: 'Favorites',
        icon: Icons.star,
        emojis: [
          Emoji(char: '❤️', name: 'Heart'),
          Emoji(char: '😂', name: 'Laugh'),
          Emoji(char: '🔥', name: 'Fire'),
        ],
      ),
    ],
  ),
  onEmojiSelected: (emoji) {
    print('Selected Emoji: ${emoji.char}');
  },
);
```

### Custom Styling

```dart
EmojiPicker(
  config: EmojiViewConfig(
    gridSpacing: 8.0,
    emojiSize: 24.0,
    backgroundColor: Colors.white,
    categoryColor: Colors.grey,
    selectedCategoryColor: Colors.blue,
  ),
  onEmojiSelected: (emoji) {
    print('Selected Emoji: ${emoji.char}');
  },
);
```

---

## API Reference

### Main Widget: `EmojiPicker`

| Property              | Type                              | Description                                    |
|-----------------------|-----------------------------------|------------------------------------------------|
| `onEmojiSelected`     | `void Function(Emoji)`           | Callback triggered when an emoji is selected. |
| `config`              | `EmojiViewConfig?`               | Configuration for customizing the emoji picker layout. |

### Utility Functions:

#### `EmojiPicker.pickEmoji`

Displays a bottom sheet with an emoji picker.

```dart
EmojiPicker.pickEmoji(
  context: context,
  selectedEmoji: (Emoji emoji) {
    // Handle selected emoji
  },
);
```

#### `EmojiPicker.getAllEmojis`

Returns a list of all emojis across default categories:

```dart
List<Emoji> allEmojis = EmojiPicker.getAllEmojis;
```

#### `EmojiPicker.getAllEmojiCategories`

Returns a list of all default emoji categories:

```dart
List<EmojiCategory> allCategories = EmojiPicker.getAllEmojiCategories;
```

---

## Additional Information

For more details on customization and integration, refer to the [documentation](https://pub.dev/packages/emoji_picker) or the [GitHub repository](https://github.com/your-repo-url).

---

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new branch for your changes.
3. Submit a pull request with a detailed description of your updates.

Ensure your code adheres to Dart and Flutter best practices, and include tests for any new functionality.

---

## Acknowledgments

A special thanks to the Flutter community for their support and inspiration. If you find this package helpful, please consider giving it a star on GitHub or leaving a review on [pub.dev](https://pub.dev/packages/emoji_picker).
