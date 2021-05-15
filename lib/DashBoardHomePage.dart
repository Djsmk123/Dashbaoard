import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/uiForMobile.dart';
import 'package:test1/uiForWeb.dart';
import 'getData.dart';
import 'constants.dart';


class DashBoardHome extends StatefulWidget {
  @override
  _DashBoardHomeState createState() => _DashBoardHomeState();
}
class _DashBoardHomeState extends State<DashBoardHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataCovid().then((value) {
      setState(() {
        activeCase=value['activeCases'].toString();
        totalCase=value['totalCases'].toString();
        recover=value['recovered'].toString();
        deaths=value['deaths'].toString();
        newActiveCase=value['activeCasesNew'].toString();
        newDeaths=value['deathsNew'].toString();
        newRecover=value['recoveredNew'].toString();
        perCentActive=((int.parse(activeCase)/int.parse(totalCase))*100).toStringAsPrecision(3);
        perCentDeaths=((int.parse(deaths)/int.parse(totalCase))*100).toStringAsPrecision(3);
        perCentRecovered=((int.parse(recover)/int.parse(totalCase))*100).toStringAsPrecision(3);
      });
      }
      );

    getVacData().then((value) {
      setState(() {
        vacData = value.toString();
      });
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    if (width>767) {
      return Contents();
    }
    else
      return Content2();
  }
}
