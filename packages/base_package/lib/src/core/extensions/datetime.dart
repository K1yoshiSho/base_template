import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// [getDeadlineString] - This function returns a formatted string representation of the date
  String getHm() {
    var df = DateFormat('Hm'); // Create a Date format object with a specific format
    return df.format(this); // Format the given dateTime object using the created formatter and return it as a string
  }

  /// [getDeadlineString] - This function returns a formatted string representation of the date
  String getDeadlineString() {
    var df = DateFormat('dd.MM.yyyy'); // Create a Date format object with a specific format
    return df.format(this); // Format the given dateTime object using the created formatter and return it as a string
  }

  /// [getServerFormat] - This function returns a formatted string representation of the date
  String getServerFormat() {
    var df = DateFormat('yyyy-MM-dd'); // Create a Date format object with a specific format
    return df.format(this); // Format the given dateTime object using the created formatter and return it as a string
  }

  /// [getDateTimeString] - This function returns a formatted string representation of the date and time
  String getDateTimeString() {
    var df = DateFormat(
      'dd.MM.yyyy HH:mm',
    ); // Create a Date format object with a specific format that includes date and time
    return df.format(this); // Format the given dateTime object using the created formatter and return it as a string
  }
}
