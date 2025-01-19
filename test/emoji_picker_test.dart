import 'package:emoji_picker/config.dart';
import 'package:emoji_picker/emoji_data.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('EmojiPickerPane uses default values when config is null',
      (WidgetTester tester) async {
    // Arrange: Create a mock emoji and a mock onEmojiSelected callback.

    void onEmojiSelected(Emoji emoji) {}

    // Act: Build the EmojiPickerPane widget with no config.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EmojiPickerPane(
            onEmojiSelected: onEmojiSelected,
          ),
        ),
      ),
    );

    // Assert: Verify default values are applied (e.g., backgroundColor and categoryColor).
    final container = find.byType(Container);
    expect(container, findsOneWidget);
    final containerWidget = tester.widget<Container>(container);
    expect(containerWidget.color, Colors.grey); // Default categoryColor

    // Test default gridSpacing and emojiSize are applied.
    final gridView = find.byType(GridView);
    expect(gridView, findsOneWidget);
  });

  testWidgets('EmojiPickerPane uses custom config values',
      (WidgetTester tester) async {
    // Arrange: Define a custom configuration for the emoji picker.
    final config = EmojiViewConfig(
      gridSpacing: 6.0,
      emojiSize: 24.0,
      backgroundColor: Colors.blue,
      categoryColor: Colors.red,
      selectedCategoryColor: Colors.green,
    );

    void onEmojiSelected(Emoji emoji) {}

    // Act: Build the EmojiPickerPane widget with the custom config.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EmojiPickerPane(
            onEmojiSelected: onEmojiSelected,
            config: config,
          ),
        ),
      ),
    );

    // Assert: Verify the custom config values are applied.
    final container = find.byType(Container);
    expect(container,
        findsWidgets); // Two Containers: one for category bar, one for GridView
    final containerWidget = tester.widget<Container>(container.first);
    expect(containerWidget.color, Colors.red); // Custom categoryColor

    final gridView = find.byType(GridView);
    expect(gridView, findsOneWidget);
    final gridViewWidget = tester.widget<GridView>(gridView);
    expect(gridViewWidget.padding,
        const EdgeInsets.all(6.0)); // Custom gridSpacing

    final textWidgets = find.byType(Text);
    expect(textWidgets, findsWidgets); // Expect emoji text elements
  });

  testWidgets('EmojiPickerPane triggers onEmojiSelected when emoji is tapped',
      (WidgetTester tester) async {
    // Arrange: Define a mock emoji and onEmojiSelected callback
    final mockEmoji = Emoji(char: '😊', name: 'smile');
    late Emoji selectedEmoji;
    void onEmojiSelected(Emoji emoji) {
      selectedEmoji = emoji;
    }

    // Act: Build the EmojiPickerPane widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: EmojiPickerPane(
            onEmojiSelected: onEmojiSelected,
          ),
        ),
      ),
    );

    // Tap on the emoji
    final emojiText = find.text(mockEmoji.char);
    await tester.tap(emojiText);
    await tester.pump();

    // Assert: Ensure the onEmojiSelected callback was triggered with the correct emoji
    expect(selectedEmoji.char, mockEmoji.char);
    expect(selectedEmoji.name, mockEmoji.name);
  });

  testWidgets('EmojiPicker correctly displays the emoji picker modal',
      (WidgetTester tester) async {
    // Arrange: Mock the callback for emoji selection
    late Emoji selectedEmoji;
    void onEmojiSelected(Emoji emoji) {
      selectedEmoji = emoji;
    }

    // Act: Call the pickEmoji method to show the emoji picker
    await EmojiPicker.pickEmoji(
      context: tester.element(find.byType(MaterialApp)),
      selectedEmoji: onEmojiSelected,
    );

    // Wait for the modal to display
    await tester.pumpAndSettle();

    // Assert: Verify the modal is displayed
    expect(find.byType(EmojiPickerPane), findsOneWidget);

    // Verify the emoji selection works
    final emojiText = find.text('😊');
    await tester.tap(emojiText);
    await tester.pump();
    expect(selectedEmoji.char, '😊');
  });

  test('EmojiPicker.getAllEmojis returns correct list of emojis', () {
    // Act: Get all emojis using the static method
    final allEmojis = EmojiPicker.getAllEmojis;

    // Assert: Verify the result contains emojis from the default categories
    expect(allEmojis, isNotEmpty);
    expect(allEmojis.first, isA<Emoji>());
    expect(allEmojis.first.char, isNotEmpty);
    expect(allEmojis.first.name, isNotEmpty);
  });

  test('EmojiPicker.getAllEmojiCategories returns the correct categories', () {
    // Act: Get all emoji categories using the static method
    final allCategories = EmojiPicker.getAllEmojiCategories;

    // Assert: Verify the result contains emoji categories
    expect(allCategories, isNotEmpty);
    expect(allCategories.first, isA<EmojiCategory>());
  });
}
