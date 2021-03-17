import 'package:flutter/material.dart';

class CustomNavitaionBarItem {
  CustomNavitaionBarItem({this.iconData, this.text});
  IconData iconData;
  String text;
}

class CustomNavitaionBar extends StatefulWidget {
  CustomNavitaionBar({
    this.items,
    this.height: 56.0,
    this.iconSize: 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.onTabSelected,
  }) {
    assert(this.items.length == 2 || this.items.length == 3 || this.items.length == 4 || this.items.length == 5);
  }
  final List<CustomNavitaionBarItem> items;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => CustomNavitaionBarState();
}

class CustomNavitaionBarState extends State<CustomNavitaionBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }


  Widget _buildTabItem({
    CustomNavitaionBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: Container(
        height: widget.height,
        child: InkWell(
          splashColor: Colors.white70,
          onTapDown: (val){ print(val.globalPosition);},
          onTap: () => onPressed(index),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(item.iconData, color: color, size: widget.iconSize),
            ],
          ),
        ),
      ),
    );
  }
}