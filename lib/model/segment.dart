import 'package:meta/meta.dart';
import 'package:restaurant_app/model/visit_log.dart';

class Segment {
  DateTime start;
  DateTime end;
  List<VisitLog> visits = [];

  Segment({
    @required this.start,
  })  : assert(start != null);


}