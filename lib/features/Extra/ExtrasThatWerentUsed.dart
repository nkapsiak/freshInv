Container(
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(15),
gradient: LinearGradient(
begin: Alignment.topLeft,
end: Alignment.bottomRight,
colors: [Colors.yellow.shade50,Colors.green.shade900],

),
),
child: Padding(
padding: const EdgeInsets.symmetric(vertical: 10),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: <Widget>[
DropdownMenu<AnimalLabel>(
controller: AnimalController,
label: Text('Animal'),
dropdownMenuEntries: animalEntries,
onSelected: (AnimalLabel? animal) {
setState(() {
selectedAnimal = animal;
});
},
),
],
),
),
),