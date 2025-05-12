import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../core/app_color.dart';

class DropdownButtonWidget<T> extends StatefulWidget{
   DropdownButtonWidget({super.key, required this.value, required this.listValue, required this.onChanged, required this.displayValue});

   final String value;
   final List<T> listValue;
   final Function(T? valueChange) onChanged;
   final String Function(T item) displayValue;


  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState<T> extends State<DropdownButtonWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<T>(
          items: widget.listValue.map<DropdownMenuItem<T>>((values) {
            return DropdownMenuItem<T>(
              value: values,
              child: Text(
                widget.displayValue(values),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }).toList(),
          onChanged: (value) {
            widget.onChanged(value);
          },
          hint: Text(
            widget.value,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          isDense: true,
          underline: SizedBox(),
          dropdownSearchData: DropdownSearchData<T>(),
          buttonStyleData: ButtonStyleData(
            elevation: 0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.primary.withOpacity(0.1),
              border: Border.all(
                color: Colors.transparent,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            height: 50,
          ),
          barrierColor: Colors.transparent,
          dropdownStyleData: DropdownStyleData(
              isOverButton: false,
              elevation: 0,
              maxHeight: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.whiteColor,
                border: Border.all(color: Colors.transparent),
              ),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: WidgetStatePropertyAll<double>(6),
                thumbVisibility: WidgetStatePropertyAll(true),
              ),
              useSafeArea: true,
              offset: const Offset(0, -10)),
          iconStyleData: const IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down_rounded),
            iconSize: 20,
            iconEnabledColor: AppColors.blackColor,
          ),
          barrierDismissible: true,
          isExpanded: true,
        ),
      ),
    );
  }
}
