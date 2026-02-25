import 'package:flutter/material.dart';

// 1. EL PUNT D'ENTRADA
// La funció main() és on comença l'execució de l'app.
// runApp() pren el widget arrel (l'arxiu principal) i el pinta a la pantalla.
void main() {
  runApp(const LaMevaApp());
}

// 2. STATELESS WIDGET (Widget sense estat)
// Aquest widget no canvia mai. És estàtic.
// Serveix per configurar l'estructura general, temes i rutes.
class LaMevaApp extends StatelessWidget {
  const LaMevaApp({super.key});

  // El mètode build() és on dissenyem la interfície (UI).
  // S'executa només una vegada per als StatelessWidget.
  @override
  Widget build(BuildContext context) {
    // MaterialApp és el contenidor principal que aporta l'estil de Google (Material Design).
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Treu la marca "DEBUG" de la cantonada
      title: 'Flutter Bàsic',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Color principal de l'app
        useMaterial3: true, // Activa l'estil més modern de Material
      ),
      // 'home' és la pantalla que es mostra primer
      home: const PantallaPrincipal(), 
    );
  }
}

// 3. STATEFUL WIDGET (Widget amb estat)+++++----------------------
// Aquest widget pot canviar la seva aparença quan l'usuari interactua (ex: botons).
// Es divideix en dues classes: el Widget en si i el seu Estat (State).
class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

// 4. LA CLASSE DE L'ESTAT
// Aquí és on guardem les variables que canvien (com un comptador).
class _PantallaPrincipalState extends State<PantallaPrincipal> {
  // Variable d'estat: quan això canvia, la pantalla s'ha de repintar.
  int _contador = 0;

  // Funció per incrementar el número
  void _incrementarContador() {
    // setState() és la màgia de Flutter.
    // Avisa al sistema que les dades han canviat i que ha de tornar a executar build().
    setState(() {
      _contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold és l'esquelet visual bàsic (Barra superior, cos, botó flotant).
    return Scaffold(
      // AppBar: La barra superior blava
      appBar: AppBar(
        title: const Text('Conceptes Bàsics'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      
      // Body: El contingut principal de la pantalla
      // Center: Alinea el contingut al centre de la pantalla
      body: Center(
        // Column: Organitza els elements verticalment (de dalt a baix)
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centra verticalment dins la columna
          children: <Widget>[
            // Un widget de text estàtic
            const Text(
              'Vegades que has premut el botó:',
              style: TextStyle(fontSize: 16),
            ),
            
            // Un espai buit per separar elements
            const SizedBox(height: 10), 
            
            // Text que mostra la variable dinàmica $_contador
            Text(
              '$_contador',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            
            const SizedBox(height: 20),

            // Un botó simple per reiniciar el comptador
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  _contador = 0;
                });
              },
              icon: const Icon(Icons.refresh),
              label: const Text("Reiniciar"),
            )
          ],
        ),
      ),
      
      // FloatingActionButton: El botó rodó a la cantonada inferior dreta
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementarContador, // Crida la funció quan es prem
        tooltip: 'Incrementar',
        child: const Icon(Icons.add),
      ),
    );
  }
}