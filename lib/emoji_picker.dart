import 'package:flutter/material.dart';

/// Emoji model to represent an emoji and its metadata.
class Emoji {
  final String char;
  final String name;

  Emoji({required this.char, required this.name});
}

/// Category model to represent an emoji category with a name, icon, and emojis.
class Category {
  final String name;
  final IconData icon;
  final List<Emoji> emojis;

  Category({required this.name, required this.icon, required this.emojis});
}

/// Default categories with predefined emojis.
class EmojiPickerCategories {
  static final defaultCategories = [
    Category(
      name: 'Smileys',
      icon: Icons.emoji_emotions,
      emojis: [
        Emoji(char: '😀', name: 'Grinning Face'),
        Emoji(char: '😂', name: 'Face With Tears of Joy'),
        Emoji(char: '😍', name: 'Heart Eyes'),
      ],
    ),
    Category(
      name: 'Animals',
      icon: Icons.pets,
      emojis: [
        Emoji(char: '🐶', name: 'Dog'),
        Emoji(char: '🐱', name: 'Cat'),
        Emoji(char: '🐼', name: 'Panda'),
      ],
    ),
    Category(
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

/// Main Emoji Picker widget.
class EmojiPicker extends StatelessWidget {
  final Function(Emoji) onEmojiSelected;
  final List<Category>? categories;
  final double gridSpacing;
  final double emojiSize;
  final Color backgroundColor;
  final Color categoryColor;
  final Color selectedCategoryColor;

  const EmojiPicker({
    super.key,
    required this.onEmojiSelected,
    this.categories,
    this.gridSpacing = 4.0,
    this.emojiSize = 20.0,
    this.backgroundColor = Colors.white,
    this.categoryColor = Colors.grey,
    this.selectedCategoryColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    final emojiCategories =
        categories ?? EmojiPickerCategories.defaultCategories;
    return DefaultTabController(
      length: emojiCategories.length,
      child: Column(
        children: [
          Container(
            color: categoryColor,
            child: TabBar(
              tabs: emojiCategories
                  .map((category) => Tab(icon: Icon(category.icon)))
                  .toList(),
              indicatorColor: selectedCategoryColor,
            ),
          ),
          Expanded(
            child: Container(
              color: backgroundColor,
              child: TabBarView(
                children: emojiCategories.map((category) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      crossAxisSpacing: gridSpacing,
                      mainAxisSpacing: gridSpacing,
                    ),
                    itemCount: category.emojis.length,
                    itemBuilder: (context, index) {
                      final emoji = category.emojis[index];
                      return GestureDetector(
                        onTap: () => onEmojiSelected(emoji),
                        child: Center(
                          child: Text(
                            emoji.char,
                            style: TextStyle(fontSize: emojiSize),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
