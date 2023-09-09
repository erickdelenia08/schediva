import 'package:intl/intl.dart';

void main() {
DateTime now = DateTime.now();
// initializeDateFormatting('en-IN', '')
//     .then((_) => print(DateFormat.yMd('en-IN').format(now)));
var aa=DateFormat.E().format(now);
print(aa);
}