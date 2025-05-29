import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  final NumberFormat _currencyFormat = NumberFormat.currency(symbol: '\$', decimalDigits: 0);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String input = newValue.text;

    if (input.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Allow digits and optionally one decimal point
    final sanitized = input.replaceAll(RegExp(r'[^\d.]'), '');

    // Only allow one decimal point
    final parts = sanitized.split('.');
    if (parts.length > 2) {
      return oldValue; // Reject input with more than one "."
    }

    String formatted;
    if (parts.length == 2) {
      // User included a decimal, respect it
      final whole = parts[0];
      final decimal = parts[1];

      // Format the whole part
      final formattedWhole = NumberFormat.decimalPattern().format(int.tryParse(whole) ?? 0);
      formatted = '\$$formattedWhole.$decimal';
    } else {
      // No decimal, just format as whole number currency
      final value = int.tryParse(parts[0]) ?? 0;
      formatted = _currencyFormat.format(value);
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length,
           affinity: TextAffinity.downstream
       ),
    );
  }
}
