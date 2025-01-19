import 'package:emoji_picker/emoji_data.dart';
import 'package:flutter/material.dart';

/// Class to hold configuration options for EmojiView.
class EmojiViewConfig {
  /// Optional custom categories for the emoji picker.
  final List<EmojiCategory>? categories;

  /// Grid spacing between emojis.
  final double gridSpacing;

  /// Size of each emoji.
  final double emojiSize;

  /// Background color of the emoji picker.
  final Color backgroundColor;

  /// Color of the category tab bar.
  final Color categoryColor;

  /// Color of the selected category indicator.
  final Color selectedCategoryColor;

  EmojiViewConfig({
    this.categories,
    this.gridSpacing = 4.0,
    this.emojiSize = 20.0,
    this.backgroundColor = Colors.white,
    this.categoryColor = Colors.grey,
    this.selectedCategoryColor = Colors.blue,
  });
}
