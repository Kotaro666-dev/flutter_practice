import 'package:camera/camera.dart';
import 'package:camera_with_focus_and_exposure/camera_preview/camera_preview_provider.dart';
import 'package:camera_with_focus_and_exposure/camera_preview/widgets/focus_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const _upperSettingHeight = 50.0;

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
        ? Stack(
            children: const [
              _CameraPreview(),
              Align(
                alignment: Alignment.topCenter,
                child: _UpperSettingArea(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _LowerSettingArea(),
              )
            ],
          )
        : Center(
            child: ElevatedButton(
              onPressed: () {
                ref.read(cameraPreviewProvider.notifier).initializeCamera();
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
    final provider = ref.watch(cameraPreviewProvider);
    final focusPositionTop = provider.focusModel.coordinateY -
        _upperSettingHeight -
        focusWidgetSize / 2;
    final focusPositionLeft =
        provider.focusModel.coordinateX - focusWidgetSize / 2;
    return GestureDetector(
      onTapDown: ref.read(cameraPreviewProvider.notifier).onTapDown,
      onTapUp: (TapUpDetails details) {
        ref.read(cameraPreviewProvider.notifier).onTapUp(details, context);
      },
      onVerticalDragUpdate:
          ref.read(cameraPreviewProvider.notifier).onVerticalDragUpdate,
      onLongPressStart: (LongPressStartDetails details) {
        ref
            .read(cameraPreviewProvider.notifier)
            .onLongPressStart(details, context);
      },
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 9 / 16,
            child: CameraPreview(
              ref.read(cameraPreviewProvider.notifier).cameraController,
            ),
          ),
          Positioned(
            top: focusPositionTop,
            left: focusPositionLeft,
            child: const FocusWidget(),
          ),
        ],
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
      height: _upperSettingHeight,
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
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Lower Setting Area',
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
