import 'package:emoji_picker/emoji_data.dart';
import 'package:flutter/material.dart';

/// Main Emoji Picker widget.
class EmojiPickerPane extends StatelessWidget {
  /// Callback triggered when an emoji is selected.
  final void Function(Emoji) onEmojiSelected;

  /// Optional custom categories for the emoji picker.
  final List<Category>? categories;

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

  const EmojiPickerPane({
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
    final emojiCategories = categories ?? EmojiPickerData.defaultCategories;

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

class EmojiPicker {
  //
  static Future<void> pickEmoji(
      {required BuildContext context,
      required Function(Emoji) selectedEmoji}) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return EmojiPickerPane(
          onEmojiSelected: (Emoji emoji) {},
        );
      },
    );
  }

  /// Function to get a list of all emojis from the default categories.
  List<Emoji> getAllEmojis() {
    return EmojiPickerData.defaultCategories
        .expand((category) => category.emojis)
        .toList();
  }

  /// Function to get a list of all categories.
  List<Category> getAllCategories() {
    return EmojiPickerData.defaultCategories;
  }

  // to return emoji view only
  Widget getEmojiPane({required Function(Emoji) selectedEmoji}) {
    return EmojiPickerPane(
      onEmojiSelected: (Emoji emoji) {
        selectedEmoji(emoji);
      },
    );
  }
}
