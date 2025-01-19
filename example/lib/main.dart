import 'package:emoji_picker/emoji_data.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Emoji Picker Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Emoji Picker Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Emoji? _selectedEmoji; // Store the selected emoji
  List<Emoji>? allEmojis;

  void _showEmojiPicker() {
    EmojiPicker.pickEmoji(
        context: context,
        selectedEmoji: (emoji) {
          setState(() {
            _selectedEmoji = emoji;
          });
        });
  }

  getAllEmojis() {
    allEmojis = EmojiPicker.getAllEmojis;
    setState(() {});
  }

  List<EmojiCategory> getAllEmojisCategories() {
    return EmojiPicker.getAllEmojiCategories;
  }

  @override
  void initState() {
    super.initState();
    getAllEmojis();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Open Emoji pane'),
                Text(
                  _selectedEmoji?.char ?? "",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _showEmojiPicker,
                  child: const Text('Show Emoji Picker'),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('All Emojis'),
                Text(
                  _selectedEmoji?.char ?? "",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (final emoji in allEmojis ?? []) ...[Text(emoji.char)]
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
