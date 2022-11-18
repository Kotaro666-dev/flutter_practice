import 'package:camera/camera.dart';
import 'package:camera_with_focus_and_exposure/camera_preview/camera_preview_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'camera_preview/camera_preview_page.dart';

class MyApp extends ConsumerWidget {
  const MyApp({
    required this.cameras,
    super.key,
  });

  final List<CameraDescription> cameras;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(cameraPreviewProvider.notifier).cameras = cameras;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CameraPreviewPage(),
    );
  }
}
