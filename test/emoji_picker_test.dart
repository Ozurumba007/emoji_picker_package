import 'package:emoji_picker/emoji_data.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EmojiPicker Tests', () {
    test('getAllEmojis returns all emojis', () {
      final emojiPicker = EmojiPicker();
      final emojis = emojiPicker.getAllEmojis();

      // Assert the number of emojis is correct.
      expect(
          emojis.length,
          EmojiPickerData.defaultCategories
              .expand((category) => category.emojis)
              .length);

      // Assert specific emojis are in the result.
      expect(emojis.any((emoji) => emoji.char == '😀'), isTrue);
      expect(emojis.any((emoji) => emoji.char == '❤️'), isTrue);
    });

    test('getAllCategories returns all categories', () {
      final emojiPicker = EmojiPicker();
      final categories = emojiPicker.getAllCategories();

      // Assert the number of categories is correct.
      expect(categories.length, EmojiPickerData.defaultCategories.length);

      // Assert specific categories are in the result.
      expect(categories.any((category) => category.name == 'Smileys'), isTrue);
      expect(categories.any((category) => category.name == 'Animals'), isTrue);
    });

    testWidgets('EmojiPickerPane displays emojis for selected category',
        (WidgetTester tester) async {
      // Create a mock onEmojiSelected callback.
      mockOnEmojiSelected(Emoji emoji) {}

      // Build the widget.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmojiPickerPane(onEmojiSelected: mockOnEmojiSelected),
          ),
        ),
      );

      // Ensure default categories are rendered as tabs.
      expect(find.byType(Tab),
          findsNWidgets(EmojiPickerData.defaultCategories.length));

      // Tap the first tab (Smileys).
      await tester.tap(find.byType(Tab).first);
      await tester.pumpAndSettle();

      // Check if the emojis in the first category are displayed.
      for (final emoji in EmojiPickerData.defaultCategories[0].emojis) {
        expect(find.text(emoji.char), findsOneWidget);
      }
    });

    testWidgets('EmojiPickerPane invokes onEmojiSelected callback on emoji tap',
        (WidgetTester tester) async {
      // Mock a variable to track which emoji was selected.
      Emoji? selectedEmoji;

      // Build the widget with a callback to set the selected emoji.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: EmojiPickerPane(
              onEmojiSelected: (emoji) => selectedEmoji = emoji,
            ),
          ),
        ),
      );

      // Tap the first emoji in the first category.
      await tester
          .tap(find.text(EmojiPickerData.defaultCategories[0].emojis[0].char));
      await tester.pumpAndSettle();

      // Assert the correct emoji was selected.
      expect(selectedEmoji, isNotNull);
      expect(selectedEmoji?.char,
          EmojiPickerData.defaultCategories[0].emojis[0].char);
    });

    testWidgets('EmojiPicker.pickEmoji displays EmojiPickerPane',
        (WidgetTester tester) async {
      // Build a MaterialApp with a Scaffold.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) => ElevatedButton(
                onPressed: () {
                  EmojiPicker.pickEmoji(
                    context: context,
                    selectedEmoji: (_) {},
                  );
                },
                child: const Text('Show Emoji Picker'),
              ),
            ),
          ),
        ),
      );

      // Tap the button to show the Emoji Picker.
      await tester.tap(find.text('Show Emoji Picker'));
      await tester.pumpAndSettle();

      // Assert the EmojiPickerPane is displayed.
      expect(find.byType(EmojiPickerPane), findsOneWidget);
    });
  });
}
