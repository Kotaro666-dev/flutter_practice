import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../camera_preview_provider.dart';
import '../exposure/exposure_model.dart';

const focusIconSize = 100.0;
const exposureCoordinatorArea = 50.0;
const exposureCoordinatorBarHeight = 160.0;
const _exposureCoordinatorBarWidth = 2.0;
const exposureCoordinatorSize = 40.0;
const focusWidgetSize = exposureCoordinatorBarHeight + exposureCoordinatorSize;

class FocusWidget extends ConsumerWidget {
  const FocusWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(cameraPreviewProvider);
    return Visibility(
      visible: provider.focusModel.isVisible,
      child: SizedBox(
        height: focusWidgetSize,
        width: focusWidgetSize,
        child: Stack(
          children: [
            Visibility(
              visible: provider.exposureModel.position == Position.left,
              child: const Align(
                alignment: Alignment.centerLeft,
                child: _ExposureCoordinator(),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: focusIconSize,
                height: focusIconSize,
                child: Image.asset(
                  'assets/focus.png',
                ),
              ),
            ),
            Visibility(
              visible: provider.exposureModel.position == Position.right,
              child: const Align(
                alignment: Alignment.centerRight,
                child: _ExposureCoordinator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExposureCoordinator extends ConsumerWidget {
  const _ExposureCoordinator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(cameraPreviewProvider);
    return SizedBox(
      width: exposureCoordinatorArea,
      child: Stack(
        children: [
          const Center(
            child: SizedBox(
              height: exposureCoordinatorBarHeight,
              width: _exposureCoordinatorBarWidth,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(
                    0XFFEECC00,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: provider.exposureModel.coordinateY,
            left: 5,
            child: SizedBox(
              width: exposureCoordinatorSize,
              height: exposureCoordinatorSize,
              child: Image.asset(
                'assets/exposure.png',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
