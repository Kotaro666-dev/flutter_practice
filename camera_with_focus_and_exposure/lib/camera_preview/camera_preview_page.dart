import 'package:camera/camera.dart';
import 'package:camera_with_focus_and_exposure/camera_preview/camera_preview_provider.dart';
import 'package:camera_with_focus_and_exposure/camera_preview/camera_preview_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CameraPreviewPage extends StatelessWidget {
  const CameraPreviewPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(cameraPreviewProvider);
    final viewModel = ref.watch(cameraPreviewProvider.notifier);
    return provider.isCameraReady &&
            viewModel.cameraController.value.isInitialized
        ? Column(
            children: const [
              _UpperSettingArea(),
              _CameraPreview(),
              Expanded(
                child: _LowerSettingArea(),
              )
            ],
          )
        : Center(
            child: ElevatedButton(
              onPressed: () {
                viewModel.initializeCamera();
              },
              child: const Text('Activate Camera'),
            ),
          );
  }
}

class _CameraPreview extends ConsumerWidget {
  const _CameraPreview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(cameraPreviewProvider.notifier);
    return AspectRatio(
      aspectRatio: 1 / viewModel.cameraController.value.aspectRatio,
      child: CameraPreview(
        viewModel.cameraController,
      ),
    );
  }
}

class _UpperSettingArea extends StatelessWidget {
  const _UpperSettingArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Upper Setting Area',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _LowerSettingArea extends StatelessWidget {
  const _LowerSettingArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Lower setting area',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
