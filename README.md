
# overlay_popup

A Flutter package that allows you to display custom pop-up elements through the `Overlay` without needing to wrap your `Scaffold`. It can be controlled through a custom controller, making it easy to show and hide overlay popups dynamically.

## Features

- Display custom popups on top of your current screen via `Overlay`.
- No need to wrap `Scaffold`, the popups can be shown independently.
- Controlled through a custom controller, enabling dynamic visibility and interactions.

## Getting started

To use `overlay_popup`, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  overlay_popup: ^1.0.0
```

Then run `flutter pub get` to install the package.

## Usage

1. Import the package in your Dart file:

```dart
import 'package:overlay_popup/overlay_popup.dart';
```

2. Create an instance of `OverlayPopupController`:

```dart
final overlayController = OverlayPopupController();
```

3. Use the controller to show or hide the popup:

```dart
overlayController.show(
child: YourContent()
); // Show the popup
overlayController.hide(); // Hide the popup
```

4. Create your custom popup widget and pass it to the controller as needed.

## Example

Here's a simple example of how to use the `OverlayPopup` in your app:

```dart
import 'package:flutter/material.dart';
import 'package:overlay_popup/overlay_popup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final OverlayPopupController _popupController = OverlayPopupController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Overlay Popup Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              _popupController.show(
                  child: YourContent()
              ); // Show the popup
            },
            child: Text('Show Popup'),
          ),
        ),
      ),
    );
  }
}
```

In this example, tapping the "Show Popup" button will display the popup, which can be controlled through the `OverlayPopupController`.

## Additional information

- For detailed documentation, check the [official Flutter documentation](https://flutter.dev/docs).
- To contribute, fork the repository, create a branch, and submit a pull request.
- For any issues or feature requests, open an issue on the repository's GitHub page.

Happy coding!
