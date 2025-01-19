import 'package:flutter/material.dart';

/// Emoji model to represent an emoji and its metadata.
class Emoji {
  final String char;
  final String name;

  Emoji({required this.char, required this.name});
}

/// Category model to represent an emoji category with a name, icon, and emojis.
class EmojiCategory {
  final String name;
  final IconData icon;
  final List<Emoji> emojis;

  EmojiCategory({required this.name, required this.icon, required this.emojis});
}

/// Default categories with predefined emojis.
class EmojiPickerData {
  static final defaultCategories = [
    EmojiCategory(
      name: 'Smileys',
      icon: Icons.emoji_emotions,
      emojis: [
        Emoji(char: '😀', name: 'Grinning Face'),
        Emoji(char: '😂', name: 'Face With Tears of Joy'),
        Emoji(char: '😍', name: 'Heart Eyes'),
      ],
    ),
    EmojiCategory(
      name: 'Animals',
      icon: Icons.pets,
      emojis: [
        Emoji(char: '🐶', name: 'Dog'),
        Emoji(char: '🐱', name: 'Cat'),
        Emoji(char: '🐼', name: 'Panda'),
      ],
    ),
    EmojiCategory(
      name: 'Symbols',
      icon: Icons.emoji_symbols,
      emojis: [
        Emoji(char: '❤️', name: 'Heart'),
        Emoji(char: '✨', name: 'Sparkles'),
        Emoji(char: '🔥', name: 'Fire'),
      ],
    ),
  ];
}
