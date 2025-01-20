import 'package:flutter/material.dart';

/// Emoji model to represent an emoji and its metadata.
class Emoji {
  final String char;
  final String name;

  Emoji({
    required this.char,
    required this.name,
  });
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
        Emoji(char: '😎', name: 'Smiling Face with Sunglasses'),
        Emoji(char: '🤗', name: 'Hugging Face'),
        Emoji(char: '🤔', name: 'Thinking Face'),
        Emoji(char: '🤐', name: 'Zipper-Mouth Face'),
        Emoji(char: '😴', name: 'Sleeping Face'),
        Emoji(char: '🤯', name: 'Exploding Head'), 
        Emoji(char: '😁', name: 'Beaming Face with Smiling Eyes'),
        Emoji(char: '😂', name: 'Face with Tears of Joy'),
        Emoji(char: '🤣', name: 'Rolling on the Floor Laughing'),
        Emoji(char: '😄', name: 'Grinning Face with Smiling Eyes'),
        Emoji(char: '😅', name: 'Grinning Face with Sweat'),
        Emoji(char: '😆', name: 'Grinning Squinting Face'),
        Emoji(char: '😉', name: 'Winking Face'),
        Emoji(char: '😊', name: 'Smiling Face with Smiling Eyes'),
        Emoji(char: '😋', name: 'Face Savoring Food'),
      ],
    ),
    EmojiCategory(
      name: 'Animals',
      icon: Icons.pets,
      emojis: [
        Emoji(char: '🐶', name: 'Dog'),
        Emoji(char: '🐱', name: 'Cat'),
        Emoji(char: '🐼', name: 'Panda'),
        Emoji(char: '🐨', name: 'Koala'),
        Emoji(char: '🐯', name: 'Tiger'),
        Emoji(char: '🦁', name: 'Lion'),
        Emoji(char: '🐮', name: 'Cow'),
        Emoji(char: '🐷', name: 'Pig'),
        Emoji(char: '🐸', name: 'Frog'),
        Emoji(char: '🐵', name: 'Monkey'),
        Emoji(char: '🦓', name: 'Zebra'),
        Emoji(char: '🦒', name: 'Giraffe'),
        Emoji(char: '🐔', name: 'Chicken'),
        Emoji(char: '🐦', name: 'Bird'),
        Emoji(char: '🐟', name: 'Fish'), 
        Emoji(char: '🐭', name: 'Mouse'),
        Emoji(char: '🐹', name: 'Hamster'),
        Emoji(char: '🐰', name: 'Rabbit'),
        Emoji(char: '🦊', name: 'Fox'),
        Emoji(char: '🐻', name: 'Bear'),
      ],
    ),
    EmojiCategory(
      name: 'Symbols',
      icon: Icons.emoji_symbols,
      emojis: [
        Emoji(char: '❤️', name: 'Heart'),
        Emoji(char: '✨', name: 'Sparkles'),
        Emoji(char: '🔥', name: 'Fire'),
        Emoji(char: '☮️', name: 'Peace Symbol'),
        Emoji(char: '⚠️', name: 'Warning'),
        Emoji(char: '♻️', name: 'Recycling Symbol'),
        Emoji(char: '✅', name: 'Check Mark'),
        Emoji(char: '❌', name: 'Cross Mark'),
      ],
    ),
     EmojiCategory(
    name: 'Travel & Places',
    icon: Icons.map,
    emojis: [
      Emoji(char: '✈️', name: 'Airplane'),
      Emoji(char: '🚗', name: 'Car'),
      Emoji(char: '🚕', name: 'Taxi'),
      Emoji(char: '🚙', name: 'SUV'),
      Emoji(char: '🚌', name: 'Bus'),
      Emoji(char: '🚎', name: 'Trolleybus'),
      Emoji(char: '🚲', name: 'Bicycle'),
      Emoji(char: '🛴', name: 'Kick Scooter'),
      Emoji(char: '🚢', name: 'Ship'),
      Emoji(char: '🏠', name: 'House'),
      Emoji(char: '🏡', name: 'House with Garden'),
      Emoji(char: '🏢', name: 'Office Building'),
      Emoji(char: '🏰', name: 'Castle'),
      Emoji(char: '🗽', name: 'Statue of Liberty'),
      Emoji(char: '🏖️', name: 'Beach'),
    ],
  ),
    EmojiCategory(
    name: 'Objects',
    icon: Icons.lightbulb,
    emojis: [
      Emoji(char: '📱', name: 'Mobile Phone'),
      Emoji(char: '💻', name: 'Laptop'),
      Emoji(char: '🖨️', name: 'Printer'),
      Emoji(char: '📷', name: 'Camera'),
      Emoji(char: '📞', name: 'Telephone Receiver'),
      Emoji(char: '🔒', name: 'Lock'),
      Emoji(char: '🔑', name: 'Key'),
      Emoji(char: '💡', name: 'Light Bulb'),
      Emoji(char: '🕯️', name: 'Candle'),
      Emoji(char: '📦', name: 'Package'),
      Emoji(char: '🧴', name: 'Lotion Bottle'),],)
  ];
}
