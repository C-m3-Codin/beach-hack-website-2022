import 'package:flutter/material.dart';

Map<String, bool> navItems = {
  'Register': false,
  'Home': true,
  'Schedule': false,
  'Events': false,
  'About': false,
  'Contact Us': false
};

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  _update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 64,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.black12),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: FlutterLogo(),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
          Row(children: [
            NavBarItem(navItems.keys.elementAt(0), navItems.values.elementAt(0),
                _update),
            NavBarItem(navItems.keys.elementAt(1), navItems.values.elementAt(1),
                _update),
            NavBarItem(navItems.keys.elementAt(2), navItems.values.elementAt(2),
                _update),
            NavBarItem(navItems.keys.elementAt(3), navItems.values.elementAt(3),
                _update),
            NavBarItem(navItems.keys.elementAt(4), navItems.values.elementAt(4),
                _update),
            NavBarItem(navItems.keys.elementAt(5), navItems.values.elementAt(5),
                _update),
          ])
        ]));
  }
}

class NavBarItem extends StatefulWidget {
  final bool isSelected;
  final String itemText;
  final Function update;

  const NavBarItem(this.itemText, this.isSelected, this.update, {Key? key})
      : super(key: key);

  @override
  State<NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        customBorder:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        onTap: () {
          navItems.updateAll((key, value) => value = false);
          navItems.update(widget.itemText, (value) => true);
          print(navItems);
          widget.update();
        },
        child: Container(
          // margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
              color: widget.isSelected ? Colors.blue : Colors.transparent,
              borderRadius: BorderRadius.circular(24)),
          child: Text(
              widget.isSelected
                  ? widget.itemText.toUpperCase()
                  : widget.itemText.toUpperCase(),
              style: TextStyle(
                  color: widget.isSelected ? Colors.white : Colors.black,
                  fontWeight:
                      widget.isSelected ? FontWeight.w800 : FontWeight.w600,
                  fontSize: widget.isSelected ? 14 : 13,
                  letterSpacing: 1.4)),
        ),
      ),
    );
  }
}
