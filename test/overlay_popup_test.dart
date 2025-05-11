import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:overlay_popup_entry/overlay_popup_entry.dart';

void main() {
  testWidgets('OverlayPopupController shows and hides popup', (WidgetTester tester) async {
    final controller = OverlayPopupController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  controller.show(
                    context: context,
                    child: Container(
                      color: Colors.red,
                      width: 200,
                      height: 200,
                    ),
                  );
                },
                child: Text('Show Popup'),
              );
            },
          ),
        ),
      ),
    );


    await tester.tap(find.text('Show Popup'));
    await tester.pumpAndSettle();


    expect(
      find.byWidgetPredicate(
            (widget) => widget is Container && widget.color == Colors.red,
      ),
      findsOneWidget,
    );


    controller.hide();
    await tester.pumpAndSettle();


    expect(
      find.byWidgetPredicate(
            (widget) => widget is Container && widget.color == Colors.red,
      ),
      findsNothing,
    );
  });
}
