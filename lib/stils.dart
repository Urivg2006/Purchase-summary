import 'package:flutter/material.dart';

/// Clase de estils compartits per tota l'aplicació
/// Centralitza colors, temes, estilos de text i decoracions
class Stils {
  /// Constructor privat per evitar instanciació
  Stils._();

  /// Colors principals
  static const Color primary = Colors.teal;
  static const Color appBarColor = Colors.teal;
  static const Color iconColor = Colors.teal;

  /// Estilos de text reutilitzables
  static const TextStyle titleText = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitleText = TextStyle(
    fontSize: 18,
  );

  /// Estilo del botó elevat
  static ButtonStyle elevatedButton = ElevatedButton.styleFrom(
    backgroundColor: primary,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  );

  /// Tema global compartit
  static final ThemeData appTheme = ThemeData(
    primarySwatch: Colors.teal,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.teal,
    ),
  );

  /// Mida estàndard de les icones
  static const double iconSize = 100.0;

  /// Decoració reutilitzable per a camps d'entrada (TextField)
  static InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
    );
  }
}

/// Widget per mostrar un resum de compra formatat
/// Mostra import brut, percentatge de descompte i import final
class PantallaResum extends StatelessWidget {
  final double importBrut;
  final double percentatgeDescompte;
  final double importFinal;

  const PantallaResum({
    super.key,
    required this.importBrut,
    required this.percentatgeDescompte,
    required this.importFinal,
  });

  @override
  Widget build(BuildContext context) {
    /// Widget auxiliar per dibuixar fila amb etiqueta i valor
    Widget row(String label, String value, {bool emphasized = false}) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: emphasized ? Stils.titleText : Stils.subtitleText),
            Text(value, style: emphasized ? Stils.titleText : Stils.subtitleText),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Títol del resum
              Text('Resum', style: Stils.titleText),
              const SizedBox(height: 12),
              /// Filera d'import brut
              row('Import brut', '€ ${importBrut.toStringAsFixed(2)}'),
              /// Filera de descompte
              row('Descompte', '${percentatgeDescompte.toStringAsFixed(2)} %'),
              /// Separador visual
              const Divider(),
              /// Filera d'import final (destacat)
              row('Import final', '€ ${importFinal.toStringAsFixed(2)}', emphasized: true),
            ],
          ),
        ),
      ),
    );
  }
}
