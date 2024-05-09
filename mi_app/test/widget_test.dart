import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mi_app/main.dart'; // Asegúrate de cambiar esto al nombre correcto de tu paquete.

void main() {
  testWidgets('Character finding test', (WidgetTester tester) async {
    // Crea el widget y añádelo al árbol de widgets.
    await tester.pumpWidget(MyApp());

    // Encuentra el campo de texto por el texto que tiene como label.
    final nameField = find.byType(TextField);
    await tester.enterText(nameField, 'Alice');

    // Encuentra y presiona el botón para determinar el personaje.
    final button = find.widgetWithText(ElevatedButton, 'Find My Character');
    await tester.tap(button);

    // Reconstruye el widget después de la simulación del evento.
    await tester.pump();

    // Verifica si el widget Text contiene el texto correcto para el nombre 'Alice'.
    expect(find.text('You are: Mimmy'), findsOneWidget);
  });
}
