import 'package:flutter/material.dart';

class OverlayPopupController {
  OverlayEntry? _entry;

  static const _classicDecoration = BoxDecoration(color: Colors.black45);

  void show({
    required BuildContext context,
    required Widget child,
    bool dismissible = true,
    BoxDecoration backgroundDecoration = _classicDecoration,
    VoidCallback? onDismiss,
  }) {
    if (_entry != null) {
      // Перерисовать с новым child, если уже показывается
      _entry!.remove();
      _entry = null;
    }

    _entry = OverlayEntry(
      builder: (_) => Stack(
        children: [
          // затемнённый фон с возможностью закрытия
          if (dismissible)
            Positioned.fill(
              child: GestureDetector(
                onTap: () {
                  hide();
                  onDismiss?.call();
                },
                child: Container(decoration: backgroundDecoration),
              ),
            ),
          Center(child: child),
        ],
      ),
    );

    Overlay.of(context, rootOverlay: true).insert(_entry!);
  }

  void hide() {
    _entry?.remove();
    _entry = null;
  }

  bool get isShowing => _entry != null;
}
