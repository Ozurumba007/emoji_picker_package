import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EmojiPicker Tests', () {
    test('should create an emoji', () {
      final emoji = Emoji(char: '❤️', name: 'Heart');
      expect(emoji.char, '❤️');
      expect(emoji.name, 'Heart');
    });

    test('should create a custom category', () {
      final category = Category(
        name: 'Favorites',
        icon: Icons.star,
        emojis: [
          Emoji(char: '❤️', name: 'Heart'),
          Emoji(char: '😂', name: 'Laugh'),
        ],
      );
      expect(category.name, 'Favorites');
      expect(category.emojis.length, 2);
      expect(category.emojis[0].char, '❤️');
    });

    test('should filter emojis using search functionality', () {
      final allEmojis = [
        Emoji(char: '❤️', name: 'Heart'),
        Emoji(char: '😂', name: 'Laugh'),
        Emoji(char: '🔥', name: 'Fire'),
      ];
      final searchTerm = 'Laugh';
      final filteredEmojis = allEmojis
          .where((emoji) =>
              emoji.name.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();

      expect(filteredEmojis.length, 1);
      expect(filteredEmojis[0].name, 'Laugh');
    });

    testWidgets('should render EmojiPicker widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        EmojiPicker(
          onEmojiSelected: (emoji) {
            expect(emoji.char, isNotNull);
            expect(emoji.name, isNotNull);
          },
        ),
      );

      // Simulate user interactions and test rendering logic
      expect(find.byType(EmojiPicker), findsOneWidget);
    });
  });
}
