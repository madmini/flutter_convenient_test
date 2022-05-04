import 'package:convenient_test/convenient_test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConvenientTestWrapperWidget(
      child: MaterialApp(
        title: 'Example',
        navigatorKey: MyApp.navigatorKey,
        initialRoute: '/home',
        routes: {
          '/home': (_) => const _HomePage(),
          '/second': (_) => const _SecondPage(),
        },
      ),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage({Key? key}) : super(key: key);

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  var count = 0;
  var starredIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('I am home page.', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 4),
            Text(
              '' + (count == 0 ? 'No tap' : (count == 1 ? '1 tap' : '$count taps')),
              style: const TextStyle(fontSize: 18),
            ),
            for (var i = 0; i < 3; ++i)
              Mark(
                name: HomePageMark.row,
                child: ListTile(
                  title: Text('Row ${i + 1}' + (starredIndex == i ? ' [Starred]' : '')),
                  trailing: IconButton(
                    onPressed: () => setState(() => starredIndex = i),
                    icon: Mark(
                      name: HomePageMark.star,
                      child: Icon(starredIndex == i ? Icons.star : Icons.star_border),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Mark(
        name: HomePageMark.button,
        child: FloatingActionButton(
          onPressed: () => setState(() => count++),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class _SecondPage extends StatelessWidget {
  const _SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SecondPage')),
      body: const Center(
        child: Text(
          'I am second page',
          style: TextStyle(fontSize: 18, height: 1.5),
        ),
      ),
    );
  }
}

enum HomePageMark {
  button,
  row,
  star,
}