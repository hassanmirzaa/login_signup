import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: const Text('Nested Multi-Select Dropdown'),
          backgroundColor: Colors.yellow,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: NestedMultiSelectDropdown(),
          ),
        ),
      ),
    );
  }
}

class NestedMultiSelectDropdown extends StatefulWidget {
  @override
  _NestedMultiSelectDropdownState createState() =>
      _NestedMultiSelectDropdownState();
}

class _NestedMultiSelectDropdownState extends State<NestedMultiSelectDropdown> {
  // Main items and their sub-options with prices
  final Map<String, List<String>> _items = {
    'Day Dream': ['Day Dream | Rs.30', 'Day Dream | Rs.50'],
    'Mi Amor': ['Mi Amor | Rs.40', 'Mi Amor | Rs.60'],
    'Chip Hop Chocolate': [
      'Chip Hop Chocolate | Rs.20',
      'Chip Hop Chocolate | Rs.70'
    ],
    'Chip Hop Vanilla': [
      'Chip Hop Vanilla | Rs.10',
      'Chip Hop Vanilla | Rs.80'
    ],
    'Eclipse': ['Eclipse | Rs.10', 'Eclipse | Rs.80'],
    'Divine': ['Divine | Rs.10', 'Divine | Rs.80'],
    'Butter Cookies': ['Butter Cookies | Rs.10', 'Butter Cookies | Rs.80'],
    'Delice': ['Delice | Rs.10', 'Delice | Rs.80'],
  };

  // Store selected main items
  List<String> _selectedMainItems = [];
  // Store selected sub-options for each main item
  Map<String, List<String>> _selectedSubOptions = {};
  // Store quantities for selected SKUs
  Map<String, String> _skuQuantities = {};

  // Function to build the main dropdown menu items
  List<DropdownMenuItem<String>> _buildMainDropdownItems() {
    return _items.keys.map((String mainItem) {
      return DropdownMenuItem<String>(
        value: mainItem,
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return CheckboxListTile(
              title: Text(mainItem),
              value: _selectedMainItems.contains(mainItem),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedMainItems.add(mainItem);
                    _selectedSubOptions[mainItem] = [];
                  } else {
                    _selectedMainItems.remove(mainItem);
                    _selectedSubOptions.remove(mainItem);
                    _skuQuantities
                        .removeWhere((key, _) => key.startsWith(mainItem));
                  }
                });
                // Update the main state
                this.setState(() {});
              },
            );
          },
        ),
      );
    }).toList();
  }

  // Function to build the sub-options dropdown menu items
  List<DropdownMenuItem<String>> _buildSubDropdownItems(String mainItem) {
    return _items[mainItem]!.map((String subOption) {
      return DropdownMenuItem<String>(
        value: subOption,
        child: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return CheckboxListTile(
              title: Text(subOption),
              value: _selectedSubOptions[mainItem]!.contains(subOption),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedSubOptions[mainItem]!.add(subOption);
                    _skuQuantities[subOption] = '1';
                  } else {
                    _selectedSubOptions[mainItem]!.remove(subOption);
                    _skuQuantities.remove(subOption);
                  }
                });
                // Update the main state
                this.setState(() {});
              },
            );
          },
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Name',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
//  width: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: TextField(
              // textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Enter your Name',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none, // Removes the border by default
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.grey, // Set the color of the border here
                    width: 1.0, // Set the width of the border here
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color:
                        Colors.blue, // Set the color of the focused border here
                    width: 2.0, // Set the width of the focused border here
                  ),
                ),
              ),
              keyboardType: TextInputType.text,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Mobile #',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
//  width: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: TextField(
              // textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Enter Mobile Number',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none, // Removes the border by default
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.grey, // Set the color of the border here
                    width: 1.0, // Set the width of the border here
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color:
                        Colors.blue, // Set the color of the focused border here
                    width: 2.0, // Set the width of the focused border here
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Brands',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Card(
          elevation: 2,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down),
              items: _buildMainDropdownItems(),
              onChanged: (_) {},
              hint: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Select Brands'),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        ..._selectedMainItems.map((mainItem) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Container(
                child: Text(
                  'Select SKU for $mainItem',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Card(
                elevation: 2,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_drop_down),
                    items: _buildSubDropdownItems(mainItem),
                    onChanged: (_) {},
                    hint: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Select Sub-options for $mainItem'),
                    ),
                  ),
                ),
              ),
            ],
          );
        }).toList(),
        const SizedBox(height: 20),
        const Text(
          'Selected Items:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ..._skuQuantities.keys.map((sku) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    sku,
                    style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: 'Qty',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide.none, // Removes the border by default
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color:
                                Colors.grey, // Set the color of the border here
                            width: 1.0, // Set the width of the border here
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors
                                .blue, // Set the color of the focused border here
                            width:
                                2.0, // Set the width of the focused border here
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          _skuQuantities[sku] = value;
                        });
                      },
                      controller:
                          TextEditingController(text: _skuQuantities[sku]),
                    ),
                  ),
                )
              ],
            ),
          );
        }).toList(),

        MaterialButton(onPressed: (){},
        minWidth: double.infinity,
        color: Colors.blue,
        child: const Text('Submit',style: TextStyle(color: Colors.white,fontSize: 18),),
        )
      ],
    );
  }
}
