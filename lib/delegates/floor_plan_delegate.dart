import 'package:flutter/material.dart';

const numRows = 14;
const numCols = 18;
// Define your own slot numbers, depending upon the id assigned by LayoutId.
// Typical usage is to define an enum like the one below, and use those
// values as the ids.

class FloorPlanDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    double height = size.height/numRows;
    double width = size.width/numCols;
    double length;
    if (height < width) {
      length = height;
    } else {
      length = width;
    }
    Size tableSize = Size(length*2, length*2);
    Size gridSize = Size(length, length);

    if (hasChild('1-1')) {
      layoutChild('1-1', BoxConstraints.tight(tableSize));
      positionChild('1-1', Offset(gridSize.width*0,gridSize.height*0));
    }
    if (hasChild('2-1')) {
      layoutChild('2-1', BoxConstraints.tight(tableSize));
      positionChild('2-1', Offset(gridSize.width*1,gridSize.height*0));
    }
    if (hasChild('3-1')) {
      layoutChild('3-1', BoxConstraints.tight(tableSize));
      positionChild('3-1', Offset(gridSize.width*2,gridSize.height*0));
    }
    if (hasChild('4-1')) {
      layoutChild('4-1', BoxConstraints.tight(tableSize));
      positionChild('4-1', Offset(gridSize.width*3,gridSize.height*0));
    }
    if (hasChild('5-1')) {
      layoutChild('5-1', BoxConstraints.tight(tableSize));
      positionChild('5-1', Offset(gridSize.width*4,gridSize.height*0));
    }
    if (hasChild('6-1')) {
      layoutChild('6-1', BoxConstraints.tight(tableSize));
      positionChild('6-1', Offset(gridSize.width*5,gridSize.height*0));
    }
    if (hasChild('7-1')) {
      layoutChild('7-1', BoxConstraints.tight(tableSize));
      positionChild('7-1', Offset(gridSize.width*6,gridSize.height*0));
    }
    if (hasChild('8-1')) {
      layoutChild('8-1', BoxConstraints.tight(tableSize));
      positionChild('8-1', Offset(gridSize.width*7,gridSize.height*0));
    }
    if (hasChild('9-1')) {
      layoutChild('9-1', BoxConstraints.tight(tableSize));
      positionChild('9-1', Offset(gridSize.width*8,gridSize.height*0));
    }
    if (hasChild('10-1')) {
      layoutChild('10-1', BoxConstraints.tight(tableSize));
      positionChild('10-1', Offset(gridSize.width*9,gridSize.height*0));
    }
    if (hasChild('11-1')) {
      layoutChild('11-1', BoxConstraints.tight(tableSize));
      positionChild('11-1', Offset(gridSize.width*10,gridSize.height*0));
    }
    if (hasChild('12-1')) {
      layoutChild('12-1', BoxConstraints.tight(tableSize));
      positionChild('12-1', Offset(gridSize.width*11,gridSize.height*0));
    }
    if (hasChild('13-1')) {
      layoutChild('13-1', BoxConstraints.tight(tableSize));
      positionChild('13-1', Offset(gridSize.width*12,gridSize.height*0));
    }
    if (hasChild('14-1')) {
      layoutChild('14-1', BoxConstraints.tight(tableSize));
      positionChild('14-1', Offset(gridSize.width*13,gridSize.height*0));
    }
    if (hasChild('15-1')) {
      layoutChild('15-1', BoxConstraints.tight(tableSize));
      positionChild('15-1', Offset(gridSize.width*14,gridSize.height*0));
    }
    if (hasChild('16-1')) {
      layoutChild('16-1', BoxConstraints.tight(tableSize));
      positionChild('16-1', Offset(gridSize.width*15,gridSize.height*0));
    }
    if (hasChild('17-1')) {
      layoutChild('17-1', BoxConstraints.tight(tableSize));
      positionChild('17-1', Offset(gridSize.width*16,gridSize.height*0));
    }
    if (hasChild('18-1')) {
      layoutChild('18-1', BoxConstraints.tight(tableSize));
      positionChild('18-1', Offset(gridSize.width*17,gridSize.height*0));
    }
    if (hasChild('1-2')) {
      layoutChild('1-2', BoxConstraints.tight(tableSize));
      positionChild('1-2', Offset(gridSize.width*0,gridSize.height*1));
    }
    if (hasChild('2-2')) {
      layoutChild('2-2', BoxConstraints.tight(tableSize));
      positionChild('2-2', Offset(gridSize.width*1,gridSize.height*1));
    }
    if (hasChild('3-2')) {
      layoutChild('3-2', BoxConstraints.tight(tableSize));
      positionChild('3-2', Offset(gridSize.width*2,gridSize.height*1));
    }
    if (hasChild('4-2')) {
      layoutChild('4-2', BoxConstraints.tight(tableSize));
      positionChild('4-2', Offset(gridSize.width*3,gridSize.height*1));
    }
    if (hasChild('5-2')) {
      layoutChild('5-2', BoxConstraints.tight(tableSize));
      positionChild('5-2', Offset(gridSize.width*4,gridSize.height*1));
    }
    if (hasChild('6-2')) {
      layoutChild('6-2', BoxConstraints.tight(tableSize));
      positionChild('6-2', Offset(gridSize.width*5,gridSize.height*1));
    }
    if (hasChild('7-2')) {
      layoutChild('7-2', BoxConstraints.tight(tableSize));
      positionChild('7-2', Offset(gridSize.width*6,gridSize.height*1));
    }
    if (hasChild('8-2')) {
      layoutChild('8-2', BoxConstraints.tight(tableSize));
      positionChild('8-2', Offset(gridSize.width*7,gridSize.height*1));
    }
    if (hasChild('9-2')) {
      layoutChild('9-2', BoxConstraints.tight(tableSize));
      positionChild('9-2', Offset(gridSize.width*8,gridSize.height*1));
    }
    if (hasChild('10-2')) {
      layoutChild('10-2', BoxConstraints.tight(tableSize));
      positionChild('10-2', Offset(gridSize.width*9,gridSize.height*1));
    }
    if (hasChild('11-2')) {
      layoutChild('11-2', BoxConstraints.tight(tableSize));
      positionChild('11-2', Offset(gridSize.width*10,gridSize.height*1));
    }
    if (hasChild('12-2')) {
      layoutChild('12-2', BoxConstraints.tight(tableSize));
      positionChild('12-2', Offset(gridSize.width*11,gridSize.height*1));
    }
    if (hasChild('13-2')) {
      layoutChild('13-2', BoxConstraints.tight(tableSize));
      positionChild('13-2', Offset(gridSize.width*12,gridSize.height*1));
    }
    if (hasChild('14-2')) {
      layoutChild('14-2', BoxConstraints.tight(tableSize));
      positionChild('14-2', Offset(gridSize.width*13,gridSize.height*1));
    }
    if (hasChild('15-2')) {
      layoutChild('15-2', BoxConstraints.tight(tableSize));
      positionChild('15-2', Offset(gridSize.width*14,gridSize.height*1));
    }
    if (hasChild('16-2')) {
      layoutChild('16-2', BoxConstraints.tight(tableSize));
      positionChild('16-2', Offset(gridSize.width*15,gridSize.height*1));
    }
    if (hasChild('17-2')) {
      layoutChild('17-2', BoxConstraints.tight(tableSize));
      positionChild('17-2', Offset(gridSize.width*16,gridSize.height*1));
    }
    if (hasChild('18-2')) {
      layoutChild('18-2', BoxConstraints.tight(tableSize));
      positionChild('18-2', Offset(gridSize.width*17,gridSize.height*1));
    }
    if (hasChild('1-3')) {
      layoutChild('1-3', BoxConstraints.tight(tableSize));
      positionChild('1-3', Offset(gridSize.width*0,gridSize.height*2));
    }
    if (hasChild('2-3')) {
      layoutChild('2-3', BoxConstraints.tight(tableSize));
      positionChild('2-3', Offset(gridSize.width*1,gridSize.height*2));
    }
    if (hasChild('3-3')) {
      layoutChild('3-3', BoxConstraints.tight(tableSize));
      positionChild('3-3', Offset(gridSize.width*2,gridSize.height*2));
    }
    if (hasChild('4-3')) {
      layoutChild('4-3', BoxConstraints.tight(tableSize));
      positionChild('4-3', Offset(gridSize.width*3,gridSize.height*2));
    }
    if (hasChild('5-3')) {
      layoutChild('5-3', BoxConstraints.tight(tableSize));
      positionChild('5-3', Offset(gridSize.width*4,gridSize.height*2));
    }
    if (hasChild('6-3')) {
      layoutChild('6-3', BoxConstraints.tight(tableSize));
      positionChild('6-3', Offset(gridSize.width*5,gridSize.height*2));
    }
    if (hasChild('7-3')) {
      layoutChild('7-3', BoxConstraints.tight(tableSize));
      positionChild('7-3', Offset(gridSize.width*6,gridSize.height*2));
    }
    if (hasChild('8-3')) {
      layoutChild('8-3', BoxConstraints.tight(tableSize));
      positionChild('8-3', Offset(gridSize.width*7,gridSize.height*2));
    }
    if (hasChild('9-3')) {
      layoutChild('9-3', BoxConstraints.tight(tableSize));
      positionChild('9-3', Offset(gridSize.width*8,gridSize.height*2));
    }
    if (hasChild('10-3')) {
      layoutChild('10-3', BoxConstraints.tight(tableSize));
      positionChild('10-3', Offset(gridSize.width*9,gridSize.height*2));
    }
    if (hasChild('11-3')) {
      layoutChild('11-3', BoxConstraints.tight(tableSize));
      positionChild('11-3', Offset(gridSize.width*10,gridSize.height*2));
    }
    if (hasChild('12-3')) {
      layoutChild('12-3', BoxConstraints.tight(tableSize));
      positionChild('12-3', Offset(gridSize.width*11,gridSize.height*2));
    }
    if (hasChild('13-3')) {
      layoutChild('13-3', BoxConstraints.tight(tableSize));
      positionChild('13-3', Offset(gridSize.width*12,gridSize.height*2));
    }
    if (hasChild('14-3')) {
      layoutChild('14-3', BoxConstraints.tight(tableSize));
      positionChild('14-3', Offset(gridSize.width*13,gridSize.height*2));
    }
    if (hasChild('15-3')) {
      layoutChild('15-3', BoxConstraints.tight(tableSize));
      positionChild('15-3', Offset(gridSize.width*14,gridSize.height*2));
    }
    if (hasChild('16-3')) {
      layoutChild('16-3', BoxConstraints.tight(tableSize));
      positionChild('16-3', Offset(gridSize.width*15,gridSize.height*2));
    }
    if (hasChild('17-3')) {
      layoutChild('17-3', BoxConstraints.tight(tableSize));
      positionChild('17-3', Offset(gridSize.width*16,gridSize.height*2));
    }
    if (hasChild('18-3')) {
      layoutChild('18-3', BoxConstraints.tight(tableSize));
      positionChild('18-3', Offset(gridSize.width*17,gridSize.height*2));
    }
    if (hasChild('1-4')) {
      layoutChild('1-4', BoxConstraints.tight(tableSize));
      positionChild('1-4', Offset(gridSize.width*0,gridSize.height*3));
    }
    if (hasChild('2-4')) {
      layoutChild('2-4', BoxConstraints.tight(tableSize));
      positionChild('2-4', Offset(gridSize.width*1,gridSize.height*3));
    }
    if (hasChild('3-4')) {
      layoutChild('3-4', BoxConstraints.tight(tableSize));
      positionChild('3-4', Offset(gridSize.width*2,gridSize.height*3));
    }
    if (hasChild('4-4')) {
      layoutChild('4-4', BoxConstraints.tight(tableSize));
      positionChild('4-4', Offset(gridSize.width*3,gridSize.height*3));
    }
    if (hasChild('5-4')) {
      layoutChild('5-4', BoxConstraints.tight(tableSize));
      positionChild('5-4', Offset(gridSize.width*4,gridSize.height*3));
    }
    if (hasChild('6-4')) {
      layoutChild('6-4', BoxConstraints.tight(tableSize));
      positionChild('6-4', Offset(gridSize.width*5,gridSize.height*3));
    }
    if (hasChild('7-4')) {
      layoutChild('7-4', BoxConstraints.tight(tableSize));
      positionChild('7-4', Offset(gridSize.width*6,gridSize.height*3));
    }
    if (hasChild('8-4')) {
      layoutChild('8-4', BoxConstraints.tight(tableSize));
      positionChild('8-4', Offset(gridSize.width*7,gridSize.height*3));
    }
    if (hasChild('9-4')) {
      layoutChild('9-4', BoxConstraints.tight(tableSize));
      positionChild('9-4', Offset(gridSize.width*8,gridSize.height*3));
    }
    if (hasChild('10-4')) {
      layoutChild('10-4', BoxConstraints.tight(tableSize));
      positionChild('10-4', Offset(gridSize.width*9,gridSize.height*3));
    }
    if (hasChild('11-4')) {
      layoutChild('11-4', BoxConstraints.tight(tableSize));
      positionChild('11-4', Offset(gridSize.width*10,gridSize.height*3));
    }
    if (hasChild('12-4')) {
      layoutChild('12-4', BoxConstraints.tight(tableSize));
      positionChild('12-4', Offset(gridSize.width*11,gridSize.height*3));
    }
    if (hasChild('13-4')) {
      layoutChild('13-4', BoxConstraints.tight(tableSize));
      positionChild('13-4', Offset(gridSize.width*12,gridSize.height*3));
    }
    if (hasChild('14-4')) {
      layoutChild('14-4', BoxConstraints.tight(tableSize));
      positionChild('14-4', Offset(gridSize.width*13,gridSize.height*3));
    }
    if (hasChild('15-4')) {
      layoutChild('15-4', BoxConstraints.tight(tableSize));
      positionChild('15-4', Offset(gridSize.width*14,gridSize.height*3));
    }
    if (hasChild('16-4')) {
      layoutChild('16-4', BoxConstraints.tight(tableSize));
      positionChild('16-4', Offset(gridSize.width*15,gridSize.height*3));
    }
    if (hasChild('17-4')) {
      layoutChild('17-4', BoxConstraints.tight(tableSize));
      positionChild('17-4', Offset(gridSize.width*16,gridSize.height*3));
    }
    if (hasChild('18-4')) {
      layoutChild('18-4', BoxConstraints.tight(tableSize));
      positionChild('18-4', Offset(gridSize.width*17,gridSize.height*3));
    }
    if (hasChild('1-5')) {
      layoutChild('1-5', BoxConstraints.tight(tableSize));
      positionChild('1-5', Offset(gridSize.width*0,gridSize.height*4));
    }
    if (hasChild('2-5')) {
      layoutChild('2-5', BoxConstraints.tight(tableSize));
      positionChild('2-5', Offset(gridSize.width*1,gridSize.height*4));
    }
    if (hasChild('3-5')) {
      layoutChild('3-5', BoxConstraints.tight(tableSize));
      positionChild('3-5', Offset(gridSize.width*2,gridSize.height*4));
    }
    if (hasChild('4-5')) {
      layoutChild('4-5', BoxConstraints.tight(tableSize));
      positionChild('4-5', Offset(gridSize.width*3,gridSize.height*4));
    }
    if (hasChild('5-5')) {
      layoutChild('5-5', BoxConstraints.tight(tableSize));
      positionChild('5-5', Offset(gridSize.width*4,gridSize.height*4));
    }
    if (hasChild('6-5')) {
      layoutChild('6-5', BoxConstraints.tight(tableSize));
      positionChild('6-5', Offset(gridSize.width*5,gridSize.height*4));
    }
    if (hasChild('7-5')) {
      layoutChild('7-5', BoxConstraints.tight(tableSize));
      positionChild('7-5', Offset(gridSize.width*6,gridSize.height*4));
    }
    if (hasChild('8-5')) {
      layoutChild('8-5', BoxConstraints.tight(tableSize));
      positionChild('8-5', Offset(gridSize.width*7,gridSize.height*4));
    }
    if (hasChild('9-5')) {
      layoutChild('9-5', BoxConstraints.tight(tableSize));
      positionChild('9-5', Offset(gridSize.width*8,gridSize.height*4));
    }
    if (hasChild('10-5')) {
      layoutChild('10-5', BoxConstraints.tight(tableSize));
      positionChild('10-5', Offset(gridSize.width*9,gridSize.height*4));
    }
    if (hasChild('11-5')) {
      layoutChild('11-5', BoxConstraints.tight(tableSize));
      positionChild('11-5', Offset(gridSize.width*10,gridSize.height*4));
    }
    if (hasChild('12-5')) {
      layoutChild('12-5', BoxConstraints.tight(tableSize));
      positionChild('12-5', Offset(gridSize.width*11,gridSize.height*4));
    }
    if (hasChild('13-5')) {
      layoutChild('13-5', BoxConstraints.tight(tableSize));
      positionChild('13-5', Offset(gridSize.width*12,gridSize.height*4));
    }
    if (hasChild('14-5')) {
      layoutChild('14-5', BoxConstraints.tight(tableSize));
      positionChild('14-5', Offset(gridSize.width*13,gridSize.height*4));
    }
    if (hasChild('15-5')) {
      layoutChild('15-5', BoxConstraints.tight(tableSize));
      positionChild('15-5', Offset(gridSize.width*14,gridSize.height*4));
    }
    if (hasChild('16-5')) {
      layoutChild('16-5', BoxConstraints.tight(tableSize));
      positionChild('16-5', Offset(gridSize.width*15,gridSize.height*4));
    }
    if (hasChild('17-5')) {
      layoutChild('17-5', BoxConstraints.tight(tableSize));
      positionChild('17-5', Offset(gridSize.width*16,gridSize.height*4));
    }
    if (hasChild('18-5')) {
      layoutChild('18-5', BoxConstraints.tight(tableSize));
      positionChild('18-5', Offset(gridSize.width*17,gridSize.height*4));
    }
    if (hasChild('1-6')) {
      layoutChild('1-6', BoxConstraints.tight(tableSize));
      positionChild('1-6', Offset(gridSize.width*0,gridSize.height*5));
    }
    if (hasChild('2-6')) {
      layoutChild('2-6', BoxConstraints.tight(tableSize));
      positionChild('2-6', Offset(gridSize.width*1,gridSize.height*5));
    }
    if (hasChild('3-6')) {
      layoutChild('3-6', BoxConstraints.tight(tableSize));
      positionChild('3-6', Offset(gridSize.width*2,gridSize.height*5));
    }
    if (hasChild('4-6')) {
      layoutChild('4-6', BoxConstraints.tight(tableSize));
      positionChild('4-6', Offset(gridSize.width*3,gridSize.height*5));
    }
    if (hasChild('5-6')) {
      layoutChild('5-6', BoxConstraints.tight(tableSize));
      positionChild('5-6', Offset(gridSize.width*4,gridSize.height*5));
    }
    if (hasChild('6-6')) {
      layoutChild('6-6', BoxConstraints.tight(tableSize));
      positionChild('6-6', Offset(gridSize.width*5,gridSize.height*5));
    }
    if (hasChild('7-6')) {
      layoutChild('7-6', BoxConstraints.tight(tableSize));
      positionChild('7-6', Offset(gridSize.width*6,gridSize.height*5));
    }
    if (hasChild('8-6')) {
      layoutChild('8-6', BoxConstraints.tight(tableSize));
      positionChild('8-6', Offset(gridSize.width*7,gridSize.height*5));
    }
    if (hasChild('9-6')) {
      layoutChild('9-6', BoxConstraints.tight(tableSize));
      positionChild('9-6', Offset(gridSize.width*8,gridSize.height*5));
    }
    if (hasChild('10-6')) {
      layoutChild('10-6', BoxConstraints.tight(tableSize));
      positionChild('10-6', Offset(gridSize.width*9,gridSize.height*5));
    }
    if (hasChild('11-6')) {
      layoutChild('11-6', BoxConstraints.tight(tableSize));
      positionChild('11-6', Offset(gridSize.width*10,gridSize.height*5));
    }
    if (hasChild('12-6')) {
      layoutChild('12-6', BoxConstraints.tight(tableSize));
      positionChild('12-6', Offset(gridSize.width*11,gridSize.height*5));
    }
    if (hasChild('13-6')) {
      layoutChild('13-6', BoxConstraints.tight(tableSize));
      positionChild('13-6', Offset(gridSize.width*12,gridSize.height*5));
    }
    if (hasChild('14-6')) {
      layoutChild('14-6', BoxConstraints.tight(tableSize));
      positionChild('14-6', Offset(gridSize.width*13,gridSize.height*5));
    }
    if (hasChild('15-6')) {
      layoutChild('15-6', BoxConstraints.tight(tableSize));
      positionChild('15-6', Offset(gridSize.width*14,gridSize.height*5));
    }
    if (hasChild('16-6')) {
      layoutChild('16-6', BoxConstraints.tight(tableSize));
      positionChild('16-6', Offset(gridSize.width*15,gridSize.height*5));
    }
    if (hasChild('17-6')) {
      layoutChild('17-6', BoxConstraints.tight(tableSize));
      positionChild('17-6', Offset(gridSize.width*16,gridSize.height*5));
    }
    if (hasChild('18-6')) {
      layoutChild('18-6', BoxConstraints.tight(tableSize));
      positionChild('18-6', Offset(gridSize.width*17,gridSize.height*5));
    }
    if (hasChild('1-7')) {
      layoutChild('1-7', BoxConstraints.tight(tableSize));
      positionChild('1-7', Offset(gridSize.width*0,gridSize.height*6));
    }
    if (hasChild('2-7')) {
      layoutChild('2-7', BoxConstraints.tight(tableSize));
      positionChild('2-7', Offset(gridSize.width*1,gridSize.height*6));
    }
    if (hasChild('3-7')) {
      layoutChild('3-7', BoxConstraints.tight(tableSize));
      positionChild('3-7', Offset(gridSize.width*2,gridSize.height*6));
    }
    if (hasChild('4-7')) {
      layoutChild('4-7', BoxConstraints.tight(tableSize));
      positionChild('4-7', Offset(gridSize.width*3,gridSize.height*6));
    }
    if (hasChild('5-7')) {
      layoutChild('5-7', BoxConstraints.tight(tableSize));
      positionChild('5-7', Offset(gridSize.width*4,gridSize.height*6));
    }
    if (hasChild('6-7')) {
      layoutChild('6-7', BoxConstraints.tight(tableSize));
      positionChild('6-7', Offset(gridSize.width*5,gridSize.height*6));
    }
    if (hasChild('7-7')) {
      layoutChild('7-7', BoxConstraints.tight(tableSize));
      positionChild('7-7', Offset(gridSize.width*6,gridSize.height*6));
    }
    if (hasChild('8-7')) {
      layoutChild('8-7', BoxConstraints.tight(tableSize));
      positionChild('8-7', Offset(gridSize.width*7,gridSize.height*6));
    }
    if (hasChild('9-7')) {
      layoutChild('9-7', BoxConstraints.tight(tableSize));
      positionChild('9-7', Offset(gridSize.width*8,gridSize.height*6));
    }
    if (hasChild('10-7')) {
      layoutChild('10-7', BoxConstraints.tight(tableSize));
      positionChild('10-7', Offset(gridSize.width*9,gridSize.height*6));
    }
    if (hasChild('11-7')) {
      layoutChild('11-7', BoxConstraints.tight(tableSize));
      positionChild('11-7', Offset(gridSize.width*10,gridSize.height*6));
    }
    if (hasChild('12-7')) {
      layoutChild('12-7', BoxConstraints.tight(tableSize));
      positionChild('12-7', Offset(gridSize.width*11,gridSize.height*6));
    }
    if (hasChild('13-7')) {
      layoutChild('13-7', BoxConstraints.tight(tableSize));
      positionChild('13-7', Offset(gridSize.width*12,gridSize.height*6));
    }
    if (hasChild('14-7')) {
      layoutChild('14-7', BoxConstraints.tight(tableSize));
      positionChild('14-7', Offset(gridSize.width*13,gridSize.height*6));
    }
    if (hasChild('15-7')) {
      layoutChild('15-7', BoxConstraints.tight(tableSize));
      positionChild('15-7', Offset(gridSize.width*14,gridSize.height*6));
    }
    if (hasChild('16-7')) {
      layoutChild('16-7', BoxConstraints.tight(tableSize));
      positionChild('16-7', Offset(gridSize.width*15,gridSize.height*6));
    }
    if (hasChild('17-7')) {
      layoutChild('17-7', BoxConstraints.tight(tableSize));
      positionChild('17-7', Offset(gridSize.width*16,gridSize.height*6));
    }
    if (hasChild('18-7')) {
      layoutChild('18-7', BoxConstraints.tight(tableSize));
      positionChild('18-7', Offset(gridSize.width*17,gridSize.height*6));
    }
    if (hasChild('1-8')) {
      layoutChild('1-8', BoxConstraints.tight(tableSize));
      positionChild('1-8', Offset(gridSize.width*0,gridSize.height*7));
    }
    if (hasChild('2-8')) {
      layoutChild('2-8', BoxConstraints.tight(tableSize));
      positionChild('2-8', Offset(gridSize.width*1,gridSize.height*7));
    }
    if (hasChild('3-8')) {
      layoutChild('3-8', BoxConstraints.tight(tableSize));
      positionChild('3-8', Offset(gridSize.width*2,gridSize.height*7));
    }
    if (hasChild('4-8')) {
      layoutChild('4-8', BoxConstraints.tight(tableSize));
      positionChild('4-8', Offset(gridSize.width*3,gridSize.height*7));
    }
    if (hasChild('5-8')) {
      layoutChild('5-8', BoxConstraints.tight(tableSize));
      positionChild('5-8', Offset(gridSize.width*4,gridSize.height*7));
    }
    if (hasChild('6-8')) {
      layoutChild('6-8', BoxConstraints.tight(tableSize));
      positionChild('6-8', Offset(gridSize.width*5,gridSize.height*7));
    }
    if (hasChild('7-8')) {
      layoutChild('7-8', BoxConstraints.tight(tableSize));
      positionChild('7-8', Offset(gridSize.width*6,gridSize.height*7));
    }
    if (hasChild('8-8')) {
      layoutChild('8-8', BoxConstraints.tight(tableSize));
      positionChild('8-8', Offset(gridSize.width*7,gridSize.height*7));
    }
    if (hasChild('9-8')) {
      layoutChild('9-8', BoxConstraints.tight(tableSize));
      positionChild('9-8', Offset(gridSize.width*8,gridSize.height*7));
    }
    if (hasChild('10-8')) {
      layoutChild('10-8', BoxConstraints.tight(tableSize));
      positionChild('10-8', Offset(gridSize.width*9,gridSize.height*7));
    }
    if (hasChild('11-8')) {
      layoutChild('11-8', BoxConstraints.tight(tableSize));
      positionChild('11-8', Offset(gridSize.width*10,gridSize.height*7));
    }
    if (hasChild('12-8')) {
      layoutChild('12-8', BoxConstraints.tight(tableSize));
      positionChild('12-8', Offset(gridSize.width*11,gridSize.height*7));
    }
    if (hasChild('13-8')) {
      layoutChild('13-8', BoxConstraints.tight(tableSize));
      positionChild('13-8', Offset(gridSize.width*12,gridSize.height*7));
    }
    if (hasChild('14-8')) {
      layoutChild('14-8', BoxConstraints.tight(tableSize));
      positionChild('14-8', Offset(gridSize.width*13,gridSize.height*7));
    }
    if (hasChild('15-8')) {
      layoutChild('15-8', BoxConstraints.tight(tableSize));
      positionChild('15-8', Offset(gridSize.width*14,gridSize.height*7));
    }
    if (hasChild('16-8')) {
      layoutChild('16-8', BoxConstraints.tight(tableSize));
      positionChild('16-8', Offset(gridSize.width*15,gridSize.height*7));
    }
    if (hasChild('17-8')) {
      layoutChild('17-8', BoxConstraints.tight(tableSize));
      positionChild('17-8', Offset(gridSize.width*16,gridSize.height*7));
    }
    if (hasChild('18-8')) {
      layoutChild('18-8', BoxConstraints.tight(tableSize));
      positionChild('18-8', Offset(gridSize.width*17,gridSize.height*7));
    }
    if (hasChild('1-9')) {
      layoutChild('1-9', BoxConstraints.tight(tableSize));
      positionChild('1-9', Offset(gridSize.width*0,gridSize.height*8));
    }
    if (hasChild('2-9')) {
      layoutChild('2-9', BoxConstraints.tight(tableSize));
      positionChild('2-9', Offset(gridSize.width*1,gridSize.height*8));
    }
    if (hasChild('3-9')) {
      layoutChild('3-9', BoxConstraints.tight(tableSize));
      positionChild('3-9', Offset(gridSize.width*2,gridSize.height*8));
    }
    if (hasChild('4-9')) {
      layoutChild('4-9', BoxConstraints.tight(tableSize));
      positionChild('4-9', Offset(gridSize.width*3,gridSize.height*8));
    }
    if (hasChild('5-9')) {
      layoutChild('5-9', BoxConstraints.tight(tableSize));
      positionChild('5-9', Offset(gridSize.width*4,gridSize.height*8));
    }
    if (hasChild('6-9')) {
      layoutChild('6-9', BoxConstraints.tight(tableSize));
      positionChild('6-9', Offset(gridSize.width*5,gridSize.height*8));
    }
    if (hasChild('7-9')) {
      layoutChild('7-9', BoxConstraints.tight(tableSize));
      positionChild('7-9', Offset(gridSize.width*6,gridSize.height*8));
    }
    if (hasChild('8-9')) {
      layoutChild('8-9', BoxConstraints.tight(tableSize));
      positionChild('8-9', Offset(gridSize.width*7,gridSize.height*8));
    }
    if (hasChild('9-9')) {
      layoutChild('9-9', BoxConstraints.tight(tableSize));
      positionChild('9-9', Offset(gridSize.width*8,gridSize.height*8));
    }
    if (hasChild('10-9')) {
      layoutChild('10-9', BoxConstraints.tight(tableSize));
      positionChild('10-9', Offset(gridSize.width*9,gridSize.height*8));
    }
    if (hasChild('11-9')) {
      layoutChild('11-9', BoxConstraints.tight(tableSize));
      positionChild('11-9', Offset(gridSize.width*10,gridSize.height*8));
    }
    if (hasChild('12-9')) {
      layoutChild('12-9', BoxConstraints.tight(tableSize));
      positionChild('12-9', Offset(gridSize.width*11,gridSize.height*8));
    }
    if (hasChild('13-9')) {
      layoutChild('13-9', BoxConstraints.tight(tableSize));
      positionChild('13-9', Offset(gridSize.width*12,gridSize.height*8));
    }
    if (hasChild('14-9')) {
      layoutChild('14-9', BoxConstraints.tight(tableSize));
      positionChild('14-9', Offset(gridSize.width*13,gridSize.height*8));
    }
    if (hasChild('15-9')) {
      layoutChild('15-9', BoxConstraints.tight(tableSize));
      positionChild('15-9', Offset(gridSize.width*14,gridSize.height*8));
    }
    if (hasChild('16-9')) {
      layoutChild('16-9', BoxConstraints.tight(tableSize));
      positionChild('16-9', Offset(gridSize.width*15,gridSize.height*8));
    }
    if (hasChild('17-9')) {
      layoutChild('17-9', BoxConstraints.tight(tableSize));
      positionChild('17-9', Offset(gridSize.width*16,gridSize.height*8));
    }
    if (hasChild('18-9')) {
      layoutChild('18-9', BoxConstraints.tight(tableSize));
      positionChild('18-9', Offset(gridSize.width*17,gridSize.height*8));
    }
    if (hasChild('1-10')) {
      layoutChild('1-10', BoxConstraints.tight(tableSize));
      positionChild('1-10', Offset(gridSize.width*0,gridSize.height*9));
    }
    if (hasChild('2-10')) {
      layoutChild('2-10', BoxConstraints.tight(tableSize));
      positionChild('2-10', Offset(gridSize.width*1,gridSize.height*9));
    }
    if (hasChild('3-10')) {
      layoutChild('3-10', BoxConstraints.tight(tableSize));
      positionChild('3-10', Offset(gridSize.width*2,gridSize.height*9));
    }
    if (hasChild('4-10')) {
      layoutChild('4-10', BoxConstraints.tight(tableSize));
      positionChild('4-10', Offset(gridSize.width*3,gridSize.height*9));
    }
    if (hasChild('5-10')) {
      layoutChild('5-10', BoxConstraints.tight(tableSize));
      positionChild('5-10', Offset(gridSize.width*4,gridSize.height*9));
    }
    if (hasChild('6-10')) {
      layoutChild('6-10', BoxConstraints.tight(tableSize));
      positionChild('6-10', Offset(gridSize.width*5,gridSize.height*9));
    }
    if (hasChild('7-10')) {
      layoutChild('7-10', BoxConstraints.tight(tableSize));
      positionChild('7-10', Offset(gridSize.width*6,gridSize.height*9));
    }
    if (hasChild('8-10')) {
      layoutChild('8-10', BoxConstraints.tight(tableSize));
      positionChild('8-10', Offset(gridSize.width*7,gridSize.height*9));
    }
    if (hasChild('9-10')) {
      layoutChild('9-10', BoxConstraints.tight(tableSize));
      positionChild('9-10', Offset(gridSize.width*8,gridSize.height*9));
    }
    if (hasChild('10-10')) {
      layoutChild('10-10', BoxConstraints.tight(tableSize));
      positionChild('10-10', Offset(gridSize.width*9,gridSize.height*9));
    }
    if (hasChild('11-10')) {
      layoutChild('11-10', BoxConstraints.tight(tableSize));
      positionChild('11-10', Offset(gridSize.width*10,gridSize.height*9));
    }
    if (hasChild('12-10')) {
      layoutChild('12-10', BoxConstraints.tight(tableSize));
      positionChild('12-10', Offset(gridSize.width*11,gridSize.height*9));
    }
    if (hasChild('13-10')) {
      layoutChild('13-10', BoxConstraints.tight(tableSize));
      positionChild('13-10', Offset(gridSize.width*12,gridSize.height*9));
    }
    if (hasChild('14-10')) {
      layoutChild('14-10', BoxConstraints.tight(tableSize));
      positionChild('14-10', Offset(gridSize.width*13,gridSize.height*9));
    }
    if (hasChild('15-10')) {
      layoutChild('15-10', BoxConstraints.tight(tableSize));
      positionChild('15-10', Offset(gridSize.width*14,gridSize.height*9));
    }
    if (hasChild('16-10')) {
      layoutChild('16-10', BoxConstraints.tight(tableSize));
      positionChild('16-10', Offset(gridSize.width*15,gridSize.height*9));
    }
    if (hasChild('17-10')) {
      layoutChild('17-10', BoxConstraints.tight(tableSize));
      positionChild('17-10', Offset(gridSize.width*16,gridSize.height*9));
    }
    if (hasChild('18-10')) {
      layoutChild('18-10', BoxConstraints.tight(tableSize));
      positionChild('18-10', Offset(gridSize.width*17,gridSize.height*9));
    }
    if (hasChild('1-11')) {
      layoutChild('1-11', BoxConstraints.tight(tableSize));
      positionChild('1-11', Offset(gridSize.width*0,gridSize.height*10));
    }
    if (hasChild('2-11')) {
      layoutChild('2-11', BoxConstraints.tight(tableSize));
      positionChild('2-11', Offset(gridSize.width*1,gridSize.height*10));
    }
    if (hasChild('3-11')) {
      layoutChild('3-11', BoxConstraints.tight(tableSize));
      positionChild('3-11', Offset(gridSize.width*2,gridSize.height*10));
    }
    if (hasChild('4-11')) {
      layoutChild('4-11', BoxConstraints.tight(tableSize));
      positionChild('4-11', Offset(gridSize.width*3,gridSize.height*10));
    }
    if (hasChild('5-11')) {
      layoutChild('5-11', BoxConstraints.tight(tableSize));
      positionChild('5-11', Offset(gridSize.width*4,gridSize.height*10));
    }
    if (hasChild('6-11')) {
      layoutChild('6-11', BoxConstraints.tight(tableSize));
      positionChild('6-11', Offset(gridSize.width*5,gridSize.height*10));
    }
    if (hasChild('7-11')) {
      layoutChild('7-11', BoxConstraints.tight(tableSize));
      positionChild('7-11', Offset(gridSize.width*6,gridSize.height*10));
    }
    if (hasChild('8-11')) {
      layoutChild('8-11', BoxConstraints.tight(tableSize));
      positionChild('8-11', Offset(gridSize.width*7,gridSize.height*10));
    }
    if (hasChild('9-11')) {
      layoutChild('9-11', BoxConstraints.tight(tableSize));
      positionChild('9-11', Offset(gridSize.width*8,gridSize.height*10));
    }
    if (hasChild('10-11')) {
      layoutChild('10-11', BoxConstraints.tight(tableSize));
      positionChild('10-11', Offset(gridSize.width*9,gridSize.height*10));
    }
    if (hasChild('11-11')) {
      layoutChild('11-11', BoxConstraints.tight(tableSize));
      positionChild('11-11', Offset(gridSize.width*10,gridSize.height*10));
    }
    if (hasChild('12-11')) {
      layoutChild('12-11', BoxConstraints.tight(tableSize));
      positionChild('12-11', Offset(gridSize.width*11,gridSize.height*10));
    }
    if (hasChild('13-11')) {
      layoutChild('13-11', BoxConstraints.tight(tableSize));
      positionChild('13-11', Offset(gridSize.width*12,gridSize.height*10));
    }
    if (hasChild('14-11')) {
      layoutChild('14-11', BoxConstraints.tight(tableSize));
      positionChild('14-11', Offset(gridSize.width*13,gridSize.height*10));
    }
    if (hasChild('15-11')) {
      layoutChild('15-11', BoxConstraints.tight(tableSize));
      positionChild('15-11', Offset(gridSize.width*14,gridSize.height*10));
    }
    if (hasChild('16-11')) {
      layoutChild('16-11', BoxConstraints.tight(tableSize));
      positionChild('16-11', Offset(gridSize.width*15,gridSize.height*10));
    }
    if (hasChild('17-11')) {
      layoutChild('17-11', BoxConstraints.tight(tableSize));
      positionChild('17-11', Offset(gridSize.width*16,gridSize.height*10));
    }
    if (hasChild('18-11')) {
      layoutChild('18-11', BoxConstraints.tight(tableSize));
      positionChild('18-11', Offset(gridSize.width*17,gridSize.height*10));
    }
    if (hasChild('1-12')) {
      layoutChild('1-12', BoxConstraints.tight(tableSize));
      positionChild('1-12', Offset(gridSize.width*0,gridSize.height*11));
    }
    if (hasChild('2-12')) {
      layoutChild('2-12', BoxConstraints.tight(tableSize));
      positionChild('2-12', Offset(gridSize.width*1,gridSize.height*11));
    }
    if (hasChild('3-12')) {
      layoutChild('3-12', BoxConstraints.tight(tableSize));
      positionChild('3-12', Offset(gridSize.width*2,gridSize.height*11));
    }
    if (hasChild('4-12')) {
      layoutChild('4-12', BoxConstraints.tight(tableSize));
      positionChild('4-12', Offset(gridSize.width*3,gridSize.height*11));
    }
    if (hasChild('5-12')) {
      layoutChild('5-12', BoxConstraints.tight(tableSize));
      positionChild('5-12', Offset(gridSize.width*4,gridSize.height*11));
    }
    if (hasChild('6-12')) {
      layoutChild('6-12', BoxConstraints.tight(tableSize));
      positionChild('6-12', Offset(gridSize.width*5,gridSize.height*11));
    }
    if (hasChild('7-12')) {
      layoutChild('7-12', BoxConstraints.tight(tableSize));
      positionChild('7-12', Offset(gridSize.width*6,gridSize.height*11));
    }
    if (hasChild('8-12')) {
      layoutChild('8-12', BoxConstraints.tight(tableSize));
      positionChild('8-12', Offset(gridSize.width*7,gridSize.height*11));
    }
    if (hasChild('9-12')) {
      layoutChild('9-12', BoxConstraints.tight(tableSize));
      positionChild('9-12', Offset(gridSize.width*8,gridSize.height*11));
    }
    if (hasChild('10-12')) {
      layoutChild('10-12', BoxConstraints.tight(tableSize));
      positionChild('10-12', Offset(gridSize.width*9,gridSize.height*11));
    }
    if (hasChild('11-12')) {
      layoutChild('11-12', BoxConstraints.tight(tableSize));
      positionChild('11-12', Offset(gridSize.width*10,gridSize.height*11));
    }
    if (hasChild('12-12')) {
      layoutChild('12-12', BoxConstraints.tight(tableSize));
      positionChild('12-12', Offset(gridSize.width*11,gridSize.height*11));
    }
    if (hasChild('13-12')) {
      layoutChild('13-12', BoxConstraints.tight(tableSize));
      positionChild('13-12', Offset(gridSize.width*12,gridSize.height*11));
    }
    if (hasChild('14-12')) {
      layoutChild('14-12', BoxConstraints.tight(tableSize));
      positionChild('14-12', Offset(gridSize.width*13,gridSize.height*11));
    }
    if (hasChild('15-12')) {
      layoutChild('15-12', BoxConstraints.tight(tableSize));
      positionChild('15-12', Offset(gridSize.width*14,gridSize.height*11));
    }
    if (hasChild('16-12')) {
      layoutChild('16-12', BoxConstraints.tight(tableSize));
      positionChild('16-12', Offset(gridSize.width*15,gridSize.height*11));
    }
    if (hasChild('17-12')) {
      layoutChild('17-12', BoxConstraints.tight(tableSize));
      positionChild('17-12', Offset(gridSize.width*16,gridSize.height*11));
    }
    if (hasChild('18-12')) {
      layoutChild('18-12', BoxConstraints.tight(tableSize));
      positionChild('18-12', Offset(gridSize.width*17,gridSize.height*11));
    }
    if (hasChild('1-13')) {
      layoutChild('1-13', BoxConstraints.tight(tableSize));
      positionChild('1-13', Offset(gridSize.width*0,gridSize.height*12));
    }
    if (hasChild('2-13')) {
      layoutChild('2-13', BoxConstraints.tight(tableSize));
      positionChild('2-13', Offset(gridSize.width*1,gridSize.height*12));
    }
    if (hasChild('3-13')) {
      layoutChild('3-13', BoxConstraints.tight(tableSize));
      positionChild('3-13', Offset(gridSize.width*2,gridSize.height*12));
    }
    if (hasChild('4-13')) {
      layoutChild('4-13', BoxConstraints.tight(tableSize));
      positionChild('4-13', Offset(gridSize.width*3,gridSize.height*12));
    }
    if (hasChild('5-13')) {
      layoutChild('5-13', BoxConstraints.tight(tableSize));
      positionChild('5-13', Offset(gridSize.width*4,gridSize.height*12));
    }
    if (hasChild('6-13')) {
      layoutChild('6-13', BoxConstraints.tight(tableSize));
      positionChild('6-13', Offset(gridSize.width*5,gridSize.height*12));
    }
    if (hasChild('7-13')) {
      layoutChild('7-13', BoxConstraints.tight(tableSize));
      positionChild('7-13', Offset(gridSize.width*6,gridSize.height*12));
    }
    if (hasChild('8-13')) {
      layoutChild('8-13', BoxConstraints.tight(tableSize));
      positionChild('8-13', Offset(gridSize.width*7,gridSize.height*12));
    }
    if (hasChild('9-13')) {
      layoutChild('9-13', BoxConstraints.tight(tableSize));
      positionChild('9-13', Offset(gridSize.width*8,gridSize.height*12));
    }
    if (hasChild('10-13')) {
      layoutChild('10-13', BoxConstraints.tight(tableSize));
      positionChild('10-13', Offset(gridSize.width*9,gridSize.height*12));
    }
    if (hasChild('11-13')) {
      layoutChild('11-13', BoxConstraints.tight(tableSize));
      positionChild('11-13', Offset(gridSize.width*10,gridSize.height*12));
    }
    if (hasChild('12-13')) {
      layoutChild('12-13', BoxConstraints.tight(tableSize));
      positionChild('12-13', Offset(gridSize.width*11,gridSize.height*12));
    }
    if (hasChild('13-13')) {
      layoutChild('13-13', BoxConstraints.tight(tableSize));
      positionChild('13-13', Offset(gridSize.width*12,gridSize.height*12));
    }
    if (hasChild('14-13')) {
      layoutChild('14-13', BoxConstraints.tight(tableSize));
      positionChild('14-13', Offset(gridSize.width*13,gridSize.height*12));
    }
    if (hasChild('15-13')) {
      layoutChild('15-13', BoxConstraints.tight(tableSize));
      positionChild('15-13', Offset(gridSize.width*14,gridSize.height*12));
    }
    if (hasChild('16-13')) {
      layoutChild('16-13', BoxConstraints.tight(tableSize));
      positionChild('16-13', Offset(gridSize.width*15,gridSize.height*12));
    }
    if (hasChild('17-13')) {
      layoutChild('17-13', BoxConstraints.tight(tableSize));
      positionChild('17-13', Offset(gridSize.width*16,gridSize.height*12));
    }
    if (hasChild('18-13')) {
      layoutChild('18-13', BoxConstraints.tight(tableSize));
      positionChild('18-13', Offset(gridSize.width*17,gridSize.height*12));
    }
    if (hasChild('1-14')) {
      layoutChild('1-14', BoxConstraints.tight(tableSize));
      positionChild('1-14', Offset(gridSize.width*0,gridSize.height*13));
    }
    if (hasChild('2-14')) {
      layoutChild('2-14', BoxConstraints.tight(tableSize));
      positionChild('2-14', Offset(gridSize.width*1,gridSize.height*13));
    }
    if (hasChild('3-14')) {
      layoutChild('3-14', BoxConstraints.tight(tableSize));
      positionChild('3-14', Offset(gridSize.width*2,gridSize.height*13));
    }
    if (hasChild('4-14')) {
      layoutChild('4-14', BoxConstraints.tight(tableSize));
      positionChild('4-14', Offset(gridSize.width*3,gridSize.height*13));
    }
    if (hasChild('5-14')) {
      layoutChild('5-14', BoxConstraints.tight(tableSize));
      positionChild('5-14', Offset(gridSize.width*4,gridSize.height*13));
    }
    if (hasChild('6-14')) {
      layoutChild('6-14', BoxConstraints.tight(tableSize));
      positionChild('6-14', Offset(gridSize.width*5,gridSize.height*13));
    }
    if (hasChild('7-14')) {
      layoutChild('7-14', BoxConstraints.tight(tableSize));
      positionChild('7-14', Offset(gridSize.width*6,gridSize.height*13));
    }
    if (hasChild('8-14')) {
      layoutChild('8-14', BoxConstraints.tight(tableSize));
      positionChild('8-14', Offset(gridSize.width*7,gridSize.height*13));
    }
    if (hasChild('9-14')) {
      layoutChild('9-14', BoxConstraints.tight(tableSize));
      positionChild('9-14', Offset(gridSize.width*8,gridSize.height*13));
    }
    if (hasChild('10-14')) {
      layoutChild('10-14', BoxConstraints.tight(tableSize));
      positionChild('10-14', Offset(gridSize.width*9,gridSize.height*13));
    }
    if (hasChild('11-14')) {
      layoutChild('11-14', BoxConstraints.tight(tableSize));
      positionChild('11-14', Offset(gridSize.width*10,gridSize.height*13));
    }
    if (hasChild('12-14')) {
      layoutChild('12-14', BoxConstraints.tight(tableSize));
      positionChild('12-14', Offset(gridSize.width*11,gridSize.height*13));
    }
    if (hasChild('13-14')) {
      layoutChild('13-14', BoxConstraints.tight(tableSize));
      positionChild('13-14', Offset(gridSize.width*12,gridSize.height*13));
    }
    if (hasChild('14-14')) {
      layoutChild('14-14', BoxConstraints.tight(tableSize));
      positionChild('14-14', Offset(gridSize.width*13,gridSize.height*13));
    }
    if (hasChild('15-14')) {
      layoutChild('15-14', BoxConstraints.tight(tableSize));
      positionChild('15-14', Offset(gridSize.width*14,gridSize.height*13));
    }
    if (hasChild('16-14')) {
      layoutChild('16-14', BoxConstraints.tight(tableSize));
      positionChild('16-14', Offset(gridSize.width*15,gridSize.height*13));
    }
    if (hasChild('17-14')) {
      layoutChild('17-14', BoxConstraints.tight(tableSize));
      positionChild('17-14', Offset(gridSize.width*16,gridSize.height*13));
    }
    if (hasChild('18-14')) {
      layoutChild('18-14', BoxConstraints.tight(tableSize));
      positionChild('18-14', Offset(gridSize.width*17,gridSize.height*13));
    }

  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => false;
}