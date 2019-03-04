import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:restaurant_app/model/physcial_table.dart';
import 'package:restaurant_app/model/floor_plan.dart';
import 'package:restaurant_app/model/restaurant_object.dart';
import 'package:restaurant_app/model/server_object.dart';

import 'package:restaurant_app/home_page.dart';

class LoaderPage extends StatefulWidget {
  LoaderPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoaderPageState createState() => _LoaderPageState();
}

class _LoaderPageState extends State<LoaderPage> {

  @override
  void initState() {
    super.initState();
    //_getRestaurantObject();
  }

  Future<RestaurantObject> _getRestaurantObject() async {
    List<PhysicalTable> tableList;
    List<FloorPlan> tempFloorPlans = [];
    final json = DefaultAssetBundle.of(context).loadString('assets/data/layout.json');
    final data = JsonDecoder().convert(await json);
    if (data is! Map) {
      throw ('Data retrieved from API is not a Map');
    }

    data.keys.forEach((key) {
      tableList = data[key].map<PhysicalTable>((dynamic data) => PhysicalTable.fromJson(data)).toList();
      tempFloorPlans.add(new FloorPlan(roomName: key, tables: tableList));
    });

    List<String> serverList;
    final json2 = DefaultAssetBundle.of(context).loadString('assets/data/staff.json');
    final data2 = JsonDecoder().convert(await json2);
    if (data2 is! Map) {
      throw ('Data2 retrieved from API is not a Map');
    }

    List<ServerObject> servers = [];
    for (int i = 0 ; i < data2['servers'].length ; i++) {
      //print(data2['servers'][i]['name']);
      servers.add(ServerObject(name: data2['servers'][i]['name']));
    }

    RestaurantObject tempRestaurantObject = new RestaurantObject(floorPlans: tempFloorPlans, floorPlanMaxIndex: data.keys.length-1, servers: servers);
    return tempRestaurantObject;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getRestaurantObject(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return new MyHomePage(restaurant: snapshot.data);
        } else
        {
          return new Container(
            alignment: AlignmentDirectional.center,
            child: new CircularProgressIndicator(),
          );
        }
      }
    );
  }
}
