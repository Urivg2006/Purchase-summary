**Català:**

# Compra de Productes 

Creeu un programa en Flutter que ampliï la funcionalitat de la practica anterior afegint una segona pantalla on es mostri el resum final de la compra. En aquesta pràctica integrareu els següents conceptes:
* **Canvi de pantalla:** Ús de `Navigator` per moure's entre vistes.
* **Pas de dades:** Enviament d'informació entre pantalles (total brut, descompte, total final).
* **Centralització d'estils:** Ús d'un fitxer `estils.dart` per unificar l'estètica.

## Descripció del projecte
L’aplicació constarà de dues pantalles principals per gestionar una compra i mostrar-ne el rebut.

### Primera pantalla: "Compra de productes"
Aquesta pantalla permet introduir dades d’una compra i acumular el total:
* Una `AppBar` amb el títol "Compra de productes".
* Dues caixes de text (`TextField`):
  * Una per al **nombre d’unitats comprades** (`keyboardType: TextInputType.number`).
  * Una per al **preu d’una unitat** en euros (`keyboardType: TextInputType.number`).
* Dos botons (`ElevatedButton`):
  * **Acumular:** Valida que les dades siguin numèriques (amb `double.tryParse()`). Si hi ha error, mostra un `SnackBar` ("⚠️ Introdueix valors numèrics vàlids."). Si és correcte, suma unitats × preu al total i mostra un `SnackBar` ("Producte afegit! Total parcial: 120.00 €").
  * **Resum final:** Si el total és 0, mostra un `SnackBar` demanant productes. Si és > 0, calcula el descompte i canvia a la segona pantalla enviant les dades.
* **Nota important:** En tornar d'aquesta segona pantalla, el total acumulat s'ha de reiniciar a 0 per preparar una nova compra.

### Segona pantalla: "Resum de la compra"
Aquesta pantalla rep les dades pel constructor i mostra el resum:
* Una icona gran de compra (`Icons.shopping_bag`, color `Colors.teal`, mida 80–100).
* Un text amb l’**import brut**, formatat amb 2 decimals.
* Un text amb el **percentatge de descompte** aplicat.
* Un text amb l’**import final** a pagar (2 decimals).
* Un botó **"Tornar enrere"** que executi `Navigator.pop(context)`.

## Taula de descomptes
El descompte s'aplica sobre el total acumulat segons la següent taula:

| Total acumulat (€) | Descompte |
| :--- | :--- |
| Fins a 50,00 € | 0 % |
| De 50,01 € a 99,99 € | 5 % |
| De 100,00 € a 199,99 € | 10 % |
| 200,00 € o més | 15 % |

## Fitxer d’estils: `estils.dart`
Creeu un fitxer `estils.dart` i definiu almenys **5 estils reutilitzables**. Importeu-lo al `main.dart` per unificar l’estètica. Exemples:
* Colors principals (classe `AppColors`).
* Estils de text per a títols i subtítols (classe `AppTextStyles`).
* Estils per als botons (classe `AppButtonStyles`).
* Decoracions per als `TextField` (vores, colors...).

## Fragment de codi de suport
Constructor recomanat per a la segona pantalla, on es reben les dades:

```dart
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
    // ...
  }
}
```
## Requisits mínims per superar la pràctica

* Validació de dades introduïdes i tractament d'errors amb `SnackBar`.
* Càlcul correcte dels imports acumulats i els descomptes.
* Navegació correcta amb enviament de dades (`Navigator.push`) i retorn (`Navigator.pop`).
* Reinici del total a **0** quan es torna a la pantalla inicial.
* Ús eficaç d'un fitxer de disseny centralitzat (`estils.dart`) amb almenys 5 estils.

## 📜 Llicència

Aquest projecte està sota la llicència **The Unlicense**. Aquest codi és de domini públic i no té cap restricció d'ús. Consulta el fitxer `LICENSE` per a més detalls.

> ⚠️ **PD:** Els HTML estan originalment fets en català però he ficat comentaris de la traducció.

---

**English:**

# Product Purchase (Pt5)

Create a Flutter application  that expands the functionality of previous practice by adding a second screen to display the final purchase summary. In this practice, you will integrate the following concepts:

* **Screen navigation:** Using `Navigator` to move between views.
* **Passing data:** Sending information between screens (gross total, discount, final total).
* **Centralizing styles:** Using an `estils.dart` file to unify aesthetics.

## Project Description

The application will consist of two main screens to manage a purchase and show its receipt.

### First Screen: "Compra de productes" (Product Purchase)

This screen allows entering purchase data and accumulating the total:

* An `AppBar` with the title *"Compra de productes"*.
* **Two text boxes (`TextField`):**
    * One for the number of purchased units (`keyboardType: TextInputType.number`).
    * One for the unit price in euros (`keyboardType: TextInputType.number`).
* **Two buttons (`ElevatedButton`):**
    * **Acumular (Accumulate):** Validates that data is numeric (using `double.tryParse()`). If there's an error, it shows a `SnackBar` (*"⚠️ Enter valid numeric values."*). If correct, it adds `units × price` to the total and shows a `SnackBar` (*"Product added! Partial total: 120.00 €"*).
    * **Resum final (Final Summary):** If the total is 0, it shows a `SnackBar` asking to add products. If > 0, it calculates the discount and navigates to the second screen sending the data.

> 💡 **Important Note:** Upon returning from this second screen, the accumulated total **must reset to 0** to prepare for a new purchase.

### Second Screen: "Resum de la compra" (Purchase Summary)

This screen receives data via the constructor and displays the summary:

* A large shopping icon (`Icons.shopping_bag`, `Colors.teal`, size 80–100).
* Text with the **gross amount**, formatted to 2 decimal places.
* Text with the **applied discount percentage**.
* Text with the **final amount to pay** (2 decimal places).
* A "Tornar enrere" (Go back) button that executes `Navigator.pop(context)`.

## Discount Table

The discount is applied to the accumulated total according to the following table:

| Accumulated Total (€) | Discount |
| :--- | :--- |
| Up to 50.00 € | **0 %** |
| From 50.01 € to 99.99 € | **5 %** |
| From 100.00 € to 199.99 € | **10 %** |
| 200.00 € or more | **15 %** |

## Styles File: `estils.dart`

Create an `estils.dart` file and define at least **5 reusable styles**. Import it into `main.dart` to unify the aesthetics. Examples:

* Main colors (`AppColors` class).
* Text styles for titles and subtitles (`AppTextStyles` class).
* Button styles (`AppButtonStyles` class).
* Input decorations for `TextField`s (borders, colors...).

## Supporting Code Snippet

Recommended constructor for the second screen, where data is received:

```dart
class ResumCompraScreen extends StatelessWidget {
  final double totalBrut;
  final double descompte;
  final double totalFinal;

  const ResumCompraScreen({
    super.key, 
    required this.totalBrut, 
    required this.descompte, 
    required this.totalFinal,
  });

  @override
  Widget build(BuildContext context) {
    // Scaffold i contingut de la pantalla...
  }
}
```
## 📋 Minimum Requirements Met

* Input data validation and error handling using `SnackBar`.
* Accurate calculation of accumulated amounts and discounts.
* Proper navigation with data passing (`Navigator.push`) and returning (`Navigator.pop`).
* Resetting the total to **0** when returning to the initial screen.
* Effective use of a centralized design file (`estils.dart`) with at least 5 styles.

## 📜 License

This project is released under **The Unlicense**. This code is in the public domain and has no restrictions on use. See the `LICENSE` file for details.

> **Note:** The original files and HTML were developed in Catalan, but translation comments have been included for better code comprehension.
