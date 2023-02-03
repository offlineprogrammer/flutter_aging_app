import 'package:flutter/material.dart';

import '../model/celebrity.dart';

class SelectCelebrityDropdown extends StatelessWidget {
  const SelectCelebrityDropdown({
    required this.onCelebritySelected,
    required this.celebritiesList,
    required this.selectedCelebrity,
    super.key,
  });

  final ValueChanged<Celebrity> onCelebritySelected;

  final Celebrity selectedCelebrity;
  final List<Celebrity> celebritiesList;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedCelebrity,
      onChanged: (selectedCelebrity) => onCelebritySelected(selectedCelebrity!),
      items: celebritiesList.map((celebrityItem) {
        return DropdownMenuItem(
            value: celebrityItem,
            child: Text(
              celebrityItem.name,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ));
      }).toList(),
    );
  }
}
