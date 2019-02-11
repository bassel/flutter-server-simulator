import 'package:meta/meta.dart';

class Response {
  final String code;
  final String message;
  var body;

  Response({@required this.code, @required this.message, this.body});
}
