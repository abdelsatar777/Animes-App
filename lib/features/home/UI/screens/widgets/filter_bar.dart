import 'package:flutter/material.dart';

class FilterBar extends StatefulWidget {
  final List<String> filters;

  const FilterBar({super.key, required this.filters});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40, // ارتفاع مناسب للفلتر
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.filters.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  if (isSelected)
                    Text("• ",
                        style: TextStyle(color: Colors.white, fontSize: 30)),
                  Text(
                    widget.filters[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white54,
                      fontSize: 20,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
