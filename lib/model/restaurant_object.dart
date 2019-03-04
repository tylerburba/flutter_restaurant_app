import 'package:meta/meta.dart';
import 'package:restaurant_app/model/physcial_table.dart';
import 'package:restaurant_app/model/floor_plan.dart';
import 'package:restaurant_app/model/server_object.dart';

class RestaurantObject {
  List<FloorPlan> floorPlans;
  List<ServerObject> servers;
  int floorPlanMaxIndex;

  RestaurantObject({
    @required this.floorPlans,
    @required this.floorPlanMaxIndex,
    @required this.servers,
  })  : assert(floorPlans != null),
        assert(floorPlanMaxIndex != null),
        assert(servers != null);
}
