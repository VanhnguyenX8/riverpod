import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CounterAPP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CounterAPP'),
    );
  }
}

// dun ConsumerWidget de lang nghe cac nha cung cap, dieu nay se giuo no thay doi khi nguoi dung cap nhap
class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(counterStateProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Text('Values: $value'),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 30),
        child: Row(
          children: [
            FloatingActionButton(
              onPressed: () {
                ref.read(counterStateProvider.notifier).state++;
              },
              child: Icon(Icons.add),
            ),
             FloatingActionButton(
              onPressed: () {
                ref.read(counterStateProvider.notifier).state--;
              },
              child: Icon(Icons.remove),
            )
          ],
        ),
      ),
    );
  }
}

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});
