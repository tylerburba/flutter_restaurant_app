import 'package:meta/meta.dart';

class PhysicalTable {
  final String id, name, shape;
  String server;

  PhysicalTable({
    @required this.id,
    @required this.name,
    @required this.shape,
    this.server
  })  : assert(name != null),
        assert(id != null),
        assert(shape != null);

  PhysicalTable.fromJson(Map jsonMap)
    : assert(jsonMap['name'] != null),
      assert(jsonMap['id'] != null),
      assert(jsonMap['shape'] != null),
      name = jsonMap['name'],
      id = jsonMap['id'],
      shape = jsonMap['shape'];
}