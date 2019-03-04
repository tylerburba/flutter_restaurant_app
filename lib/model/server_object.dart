import 'package:meta/meta.dart';

class ServerObject {
  String name;
  int guestThisShift = 0;
  bool isActive = true;
  int guestHoldover = 0;
  int guestThisSegment = 0;
  DateTime lastSeating;
  bool isNext = false;

  ServerObject({
    @required this.name,
  })  : assert(name != null);
}
