import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_riverpod/model/photo.dart';
import 'package:test_riverpod/state/state_manager.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Photo>> photos = ref.watch(photoStateFuture);
    return Scaffold(
      appBar: AppBar(
        title: const Text('riverPod test'),
      ),
      body: photos.when(
          data: (photos) {
            return ListView.builder(
              itemCount: photos.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(photos[index].thumbnailUrl as String),
                      ),
                      title: Text('${photos[index].title}'),
                    ),
                  ],
                );
              },
            );
          },
          error: (err, stack) => Center(child: Text('${err.toString()}'),),
          loading: () => const Center(child: CircularProgressIndicator(),)),
    );
  }
}
