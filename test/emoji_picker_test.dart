import 'package:emoji_picker/emoji_data.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EmojiPickerPane Widget Tests', () {
    testWidgets('renders the default categories with TabBar and TabBarView',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: EmojiPickerPane(
            onEmojiSelected: (emoji) {},
          ),
        ),
      );

      // Verify TabBar has correct number of tabs
      expect(find.byType(Tab), findsWidgets);

      // Verify TabBarView is present
      expect(find.byType(TabBarView), findsOneWidget);
    });

    testWidgets('calls onEmojiSelected when an emoji is tapped',
        (WidgetTester tester) async {
      Emoji? selectedEmoji;
      await tester.pumpWidget(
        MaterialApp(
          home: EmojiPickerPane(
            onEmojiSelected: (emoji) {
              selectedEmoji = emoji;
            },
          ),
        ),
      );

      // Simulate tapping on the first emoji
      final firstEmojiFinder =
          find.text(EmojiPickerData.defaultCategories.first.emojis.first.char);
      await tester.tap(firstEmojiFinder);
      await tester.pump();

      expect(selectedEmoji, isNotNull);
      expect(selectedEmoji!.char,
          EmojiPickerData.defaultCategories.first.emojis.first.char);
    });

    testWidgets('applies custom properties', (WidgetTester tester) async {
      const backgroundColor = Colors.black;
      const categoryColor = Colors.red;
      const selectedCategoryColor = Colors.green;

      await tester.pumpWidget(
        MaterialApp(
          home: EmojiPickerPane(
            onEmojiSelected: (emoji) {},
            backgroundColor: backgroundColor,
            categoryColor: categoryColor,
            selectedCategoryColor: selectedCategoryColor,
          ),
        ),
      );

      // Verify custom background color
      final backgroundFinder = find.byWidgetPredicate(
        (widget) => widget is Container && widget.color == backgroundColor,
      );
      expect(backgroundFinder, findsOneWidget);

      // Verify custom category color
      final categoryFinder = find.byWidgetPredicate(
        (widget) => widget is Container && widget.color == categoryColor,
      );
      expect(categoryFinder, findsOneWidget);
    });
  });

  group('EmojiPicker Utility Tests', () {
    test('getAllEmojis returns a list of all emojis', () {
      final emojis = EmojiPicker.getAllEmojis;
      expect(emojis, isNotEmpty);
      expect(emojis.length, greaterThan(0));
    });

    test('getAllEmojiCategories returns a list of all categories', () {
      final categories = EmojiPicker.getAllEmojiCategories();
      expect(categories, isNotEmpty);
      expect(categories.length, greaterThan(0));
    });

    testWidgets('pickEmoji opens modal bottom sheet',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  EmojiPicker.pickEmoji(
                    context: context,
                    selectedEmoji: (emoji) {},
                  );
                },
                child: const Text('Open Emoji Picker'),
              );
            },
          ),
        ),
      );

      // Tap button to open modal
      await tester.tap(find.text('Open Emoji Picker'));
      await tester.pumpAndSettle();

      // Verify EmojiPickerPane is shown
      expect(find.byType(EmojiPickerPane), findsOneWidget);
    });
  });
}
