import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:papago_example/papago.dart';

class InputTextPage extends StatefulWidget {
  const InputTextPage({super.key});

  @override
  State<InputTextPage> createState() => _InputTextPageState();
}

class _InputTextPageState extends State<InputTextPage> {
  TextEditingController _textController = TextEditingController();

  String _translatedText = '';

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('사용자 입력 변환'),
        leading: IconButton(
          onPressed: () => context.go('/'),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: _textController,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    var result = await papago(_textController.text, 'en');
                    setState(() {
                      _translatedText = result;
                    });
                  },
                  child: const Text('영어 변환'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    var result = await papago(_textController.text, 'ja');
                    setState(() {
                      _translatedText = result;
                    });
                  },
                  child: const Text('일본어 변환'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    var result = await papago(_textController.text, 'zh-CN');
                    setState(() {
                      _translatedText = result;
                    });
                  },
                  child: const Text('중국어 변환'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              height: 300,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(_translatedText),
            ),
          ],
        ),
      ),
    );
  }
}