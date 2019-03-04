import 'package:meta/meta.dart';

import 'package:restaurant_app/model/physcial_table.dart';

class FloorPlan {
  final String roomName;
  List<PhysicalTable> tables;

  FloorPlan({
    @required this.roomName,
    @required this.tables,
  })  : assert(roomName != null),
        assert(tables != null);
}