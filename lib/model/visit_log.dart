import 'package:meta/meta.dart';

class VisitLog {
  DateTime visitStart, visitEnd;
  String visitServer;
  String visitTable;
  int visitGuestCount;

  VisitLog({
    @required this.visitStart,
    @required this.visitServer,
    @required this.visitTable,
    @required this.visitGuestCount,
  })  : assert(visitStart != null),
        assert(visitServer != null),
        assert(visitGuestCount != null),
        assert(visitTable != null);
}