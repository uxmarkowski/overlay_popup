import 'package:flutter/material.dart';
import 'package:overlay_popup_entry/overlay_popup_entry.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OverlayPopup Example',
      home: const PopupDemoPage(),
    );
  }
}

class PopupDemoPage extends StatefulWidget {
  const PopupDemoPage({super.key});

  @override
  State<PopupDemoPage> createState() => _PopupDemoPageState();
}

class _PopupDemoPageState extends State<PopupDemoPage> {
  final overlayController = OverlayPopupController();



  void _showPopup() {
    overlayController.show(
      context: context,
      child: const MyPopup(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OverlayPopup Demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: _showPopup,
          child: const Text('Show Popup'),
        ),
      ),
    );
  }
}

class MyPopup extends StatelessWidget {
  const MyPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
              )
            ],
          ),
          child: const Text('Hello from OverlayPopup!'),
        ),
      ),
    );
  }
}
