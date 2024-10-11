import 'package:flutter/material.dart';
import 'package:test_isaac/core/ui/design/atoms/text/body/md_p.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.options,
    required this.onSelect,
    this.option,
  });

  final List<String> options;
  final Function onSelect;
  final String? option;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(.3),
          width: 1,
        ),
      ),
      child: DropdownButton<String>(
        value: widget.option,
        hint: const MdP(
            title: 'Arquetipo',
            color: Colors.grey,
            align: TextAlign.start,
            fontWeight: FontWeight.w500),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
        isExpanded: true,
        underline: const SizedBox(),
        onChanged: (String? newValue) {
          widget.onSelect(newValue);
        },
        items: widget.options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: MdP(
                title: value,
                color: Colors.black,
                align: TextAlign.start,
                fontWeight: FontWeight.w500),
          );
        }).toList(),
      ),
    );
  }
}
