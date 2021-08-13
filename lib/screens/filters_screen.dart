import 'package:flutter/material.dart';

// import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  void _save() {
    final selectedFilters = {
      'gluten': _glutenFree,
      'lactose': _lactoseFree,
      'vegan': _vegan,
      'vegetarian': _vegetarian,
    };
    widget.saveFilters(selectedFilters);
  }

  Widget _buildSwitchTile(String title, String description, bool currentValue,
      final Function(bool) updateValue) {
    return SwitchListTile(
      title: Text(title, style: Theme.of(context).textTheme.bodyText1),
      subtitle: Text(description, style: Theme.of(context).textTheme.bodyText2),
      activeColor: Theme.of(context).colorScheme.primary,
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
      ),
      // drawer: MainDrawer(),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
            child: Text(
              'Settings',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                fontSize: 36,
              ),
            ),
          ),
          _buildSwitchTile(
            'Gluten free',
            'Include gluten free meals only',
            _glutenFree,
            (newValue) {
              setState(
                () {
                  _glutenFree = newValue;
                  _save();
                },
              );
            },
          ),
          _buildSwitchTile(
            'Lactose free',
            'Include lactose free meals only',
            _lactoseFree,
            (newValue) {
              setState(
                () {
                  _lactoseFree = newValue;
                  _save();
                },
              );
            },
          ),
          _buildSwitchTile(
            'Vegetarian',
            'Include vegetarian meals only',
            _vegetarian,
            (newValue) {
              setState(
                () {
                  _vegetarian = newValue;
                  _save();
                },
              );
            },
          ),
          _buildSwitchTile(
            'Vegan',
            'Include vegan meals only',
            _vegan,
            (newValue) {
              setState(
                () {
                  _vegan = newValue;
                  _save();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
