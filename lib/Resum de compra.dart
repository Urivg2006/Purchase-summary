import 'package:flutter/material.dart';
import 'stils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compra',
      // title: 'Buys',
      debugShowCheckedModeBanner: false,
      theme: Stils.appTheme, 
      home: const PantallaInici(),
    );
  }
}

class PantallaInici extends StatelessWidget {
  const PantallaInici({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController unitsController = TextEditingController();
    final TextEditingController preuController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Compra de productes"), backgroundColor: Stils.appBarColor),
      // appBar: AppBar(title: const Text("Product Purchase"), backgroundColor: Stils.appBarColor),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: unitsController,
              keyboardType: TextInputType.number,
              decoration: Stils.inputDecoration("Nombre d'unitats"),
              // decoration: Stils.inputDecoration("Number of units"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: preuController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: Stils.inputDecoration("Preu per unitat"),
              // decoration: Stils.inputDecoration("Unit price"),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                final unitsText = unitsController.text.trim();
                final preuText = preuController.text.trim();

                // Validar que els camps no estiguin buits
                // Validate that the fields are not empty
                if (unitsText.isEmpty || preuText.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("⚠️ Introdueix les unitats i el preu."),
                      // content: Text("⚠️ Please enter both units and price."),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                  return;
                }

                // Convertir text a nombres
                // Convert text to numbers
                final units = int.tryParse(unitsText);
                final preu = double.tryParse(preuText.replaceAll(',', '.'));

                // Validar que els nombres siguin vàlids
                // Validate that the numbers are valid
                if (units == null || preu == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("⚠️ Introdueix valors numèrics vàlids."),
                      // content: Text("⚠️ Please enter valid numeric values."),
                      backgroundColor: Colors.redAccent,
                    ),
                  );
                  return;
                }
                final totalPreu = units * preu;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PantallaPerfil(totalPreu: totalPreu),
                  ),
                );
              },
              style: Stils.elevatedButton,
              child: const Text("Calcular i veure resum"),
              // child: const Text("Calculate and view summary"),
            ),
          ],
        ),
      ),
    );
  }
}
class PantallaPerfil extends StatelessWidget {
  final double totalPreu;

  const PantallaPerfil({super.key, required this.totalPreu});

  /// Calcula el descompte segons el preu total
  /// Calculate the discount based on the total price
  /// Descomptes: 0% fins 50€, 5% de 50-99€, 10% de 100-199€, 15% de 200€ en adelant
  /// Discounts: 0% up to 50€, 5% from 50-99€, 10% from 100-199€, 15% from 200€ and above
  double _calcularDescompte(double total) {
    if (total >= 200) {
      return total * 0.15;
    } else if (total >= 100) {
      return total * 0.10;
    } else if (total >= 50) {
      return total * 0.05;
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    // Calcular els valors del resum
    // Calculate the summary values
    final descompte = _calcularDescompte(totalPreu);
    final percentatge = totalPreu > 0 ? (descompte / totalPreu) * 100 : 0.0;
    final importFinal = totalPreu - descompte;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Resum de compra"),
        // title: const Text("Purchase summary"),
        backgroundColor: Stils.appBarColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icona de rebut
            // Receipt icon
            Icon(Icons.receipt_long, size: Stils.iconSize, color: Stils.iconColor),
            const SizedBox(height: 20),
            // Widget que mostra el resum formatat
            // Widget that displays the summary formatted
            PantallaResum(
              importBrut: totalPreu,
              percentatgeDescompte: percentatge,
              importFinal: importFinal,
            ),
            const SizedBox(height: 16),
            // Botó per tornar a la pantalla anterior
            // Button to go back to the previous screen
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text("Tornar enrere"),
              // label: const Text("Back"),
              style: Stils.elevatedButton,
            ),
          ],
        ),
      ),
    );
  }
}