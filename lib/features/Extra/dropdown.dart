import 'package:flutter/material.dart';

void main() => runApp(const DropdownMenuExample());

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  final TextEditingController AnimalController = TextEditingController();
  final TextEditingController PriceController = TextEditingController();
  AnimalLabel? selectedAnimal;
  PriceLabel? selectedIcon;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<AnimalLabel>> animalEntries =
    <DropdownMenuEntry<AnimalLabel>>[];
    for (final AnimalLabel animal in AnimalLabel.values) {
      animalEntries.add(DropdownMenuEntry<AnimalLabel>(
          value: animal, label: animal.label));
    }

    final List<DropdownMenuEntry<PriceLabel>> iconEntries =
    <DropdownMenuEntry<PriceLabel>>[];
    for (final PriceLabel icon in PriceLabel.values) {
      iconEntries
          .add(DropdownMenuEntry<PriceLabel>(value: icon, label: icon.label));
    }

    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
      home: Scaffold(
        body: SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DropdownMenu<AnimalLabel>(
                        controller: AnimalController,
                        label: const Text('Animal'),
                        dropdownMenuEntries: animalEntries,
                        onSelected: (AnimalLabel? animal) {
                          setState(() {
                            selectedAnimal = animal;
                          });
                        },
                      ),
                      const SizedBox(width: 20),
                      DropdownMenu<PriceLabel>(
                        controller: PriceController,
                        enableFilter: true,
                        leadingIcon: const Icon(Icons.search),
                        label: const Text('Icon'),
                        dropdownMenuEntries: iconEntries,
                        inputDecorationTheme:
                        const InputDecorationTheme(filled: true),
                        onSelected: (PriceLabel? icon) {
                          setState(() {
                            selectedIcon = icon;
                          });
                        },
                      )
                    ],
                  ),
                ),
                if (selectedAnimal != null && selectedIcon != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          'You selected a ${selectedAnimal?.label} Totaling to the amount of ${selectedIcon?.label}'),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(
                            selectedIcon?.icon,
                          ))
                    ],
                  )
                else
                  const Text('Please select a color and an icon.')
              ],
            )),
      ),
    );
  }
}

enum AnimalLabel {
  blue('Deer', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Yellow', Colors.yellow),
  grey('Grey', Colors.grey);

  const AnimalLabel(this.label, this.animal);
  final String label;
  final Color animal;
}

enum PriceLabel {
  smile('Smile', Icons.sentiment_satisfied_outlined),
  cloud(
    'Cloud',
    Icons.cloud_outlined,
  ),
  brush('Brush', Icons.brush_outlined),
  heart('Heart', Icons.favorite);

  const PriceLabel(this.label, this.icon);
  final String label;
  final IconData icon;
}
