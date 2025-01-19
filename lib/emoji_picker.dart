import 'package:emoji_picker/config.dart';
import 'package:emoji_picker/emoji_data.dart';
import 'package:flutter/material.dart';

/// Main Emoji Picker widget.
class EmojiPickerPane extends StatelessWidget {
  /// Callback triggered when an emoji is selected.
  final void Function(Emoji) onEmojiSelected;

  /// Configuration for the emoji picker view.
  final EmojiViewConfig? config;

  const EmojiPickerPane({
    super.key,
    required this.onEmojiSelected,
    this.config, // Now nullable
  });

  @override
  Widget build(BuildContext context) {
    // Default values if config is null
    final emojiCategories = [
      ...EmojiPickerData.defaultCategories,
      ...(config?.categories ?? []),
    ];

    return DefaultTabController(
      length: emojiCategories.length,
      child: Column(
        children: [
          Container(
            color: config?.categoryColor ?? Colors.grey,
            child: TabBar(
              tabs: emojiCategories
                  .map((category) => Tab(icon: Icon(category.icon)))
                  .toList(),
              indicatorColor: config?.selectedCategoryColor ?? Colors.blue,
            ),
          ),
          Expanded(
            child: Container(
              color: config?.backgroundColor ?? Colors.white,
              child: TabBarView(
                children: emojiCategories.map((category) {
                  return GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      crossAxisSpacing: config?.gridSpacing ?? 4.0,
                      mainAxisSpacing: config?.gridSpacing ?? 4.0,
                    ),
                    itemCount: category.emojis.length,
                    itemBuilder: (context, index) {
                      final emoji = category.emojis[index];
                      return GestureDetector(
                        onTap: () => onEmojiSelected(emoji),
                        child: Center(
                          child: Text(
                            emoji.char,
                            style:
                                TextStyle(fontSize: config?.emojiSize ?? 20.0),
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
  static List<Emoji> get getAllEmojis {
    return EmojiPickerData.defaultCategories
        .expand((category) => category.emojis)
        .toList();
  }

  /// Function to get a list of all categories.
  static List<EmojiCategory> get getAllEmojiCategories {
    return EmojiPickerData.defaultCategories;
  }

  // to return emoji view only
  Widget getEmojiPane(
      {EmojiViewConfig? config, required Function(Emoji) selectedEmoji}) {
    return EmojiPickerPane(
      config: config,
      onEmojiSelected: (Emoji emoji) {
        selectedEmoji(emoji);
      },
    );
  }
}
