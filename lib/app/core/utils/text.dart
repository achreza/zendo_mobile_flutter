import 'package:intl/intl.dart';

class TextUtil {
  static String toRupiah(int value) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(value);
  }

  static String formatDate(DateTime date) {
    return DateFormat('EEEE, dd MMMM yyyy - HH.mm').format(date);
  }
}
