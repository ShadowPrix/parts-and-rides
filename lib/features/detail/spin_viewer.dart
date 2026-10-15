import 'package:flutter/material.dart';
import '../../core/theme.dart';

/// Drag left/right to rotate. Pass real photos in [frames] later;
/// with no frames it shows a placeholder that flips as you drag.
class SpinViewer extends StatefulWidget {
  const SpinViewer({super.key, this.frames = const []});
  final List<ImageProvider> frames;

  @override
  State<SpinViewer> createState() => _SpinViewerState();
}

class _SpinViewerState extends State<SpinViewer> {
  double _pos = 0;
  int get _count => widget.frames.isEmpty ? 36 : widget.frames.length;
  int get _index => _pos.floor() % _count;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Preload every frame so rotating never flickers
    for (final f in widget.frames) {
      precacheImage(f, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (d) =>
          setState(() => _pos = (_pos - d.delta.dx / 6) % _count),
      child: Container(
        height: 310,
        width: double.infinity,
        color: AppColors.surface,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (widget.frames.isNotEmpty)
              Image(
                image: widget.frames[_index],
                fit: BoxFit.contain,
                gaplessPlayback: true,
              )
            else
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(6.2832 * _index / _count),
                child: const Icon(Icons.two_wheeler_rounded,
                    size: 190, color: AppColors.accent),
              ),
            Positioned(
              bottom: 16,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.bg,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Text('Drag to rotate · 360°',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: AppColors.muted)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}