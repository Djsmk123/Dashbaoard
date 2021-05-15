import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'CovidbyStats.dart';

var totalCase="";
var activeCase="";
var recover="";
var deaths="";
var vacData="";
var newActiveCase="";
var newRecover="";
var newDeaths="";
var perCentActive="";
var perCentDeaths="";
var perCentRecovered="";
class chartData1 {
  chartData1({required this.title,required this.x,required this.clr ,});
  final String title;
  final int x;
  final Color clr;

}
List<chartData1> chartData = [
  chartData1(title:'TotalCase', x: int.parse(totalCase),clr: Color(0xFF6E7191)),
  chartData1(title:'ActiveCases', x: int.parse(activeCase),clr: Color(0xFF0066FF)),
  chartData1(title:'Recovered', x: int.parse(recover),clr: Color(0xFF05E945)),
  chartData1(title:'Deaths', x: int.parse(deaths),clr: Color(0xFFFF0000)),
];
double fsize=15;
var kTextStyle2=TextStyle(
color: Colors.black,
fontSize: fsize,
fontStyle: FontStyle.normal,
letterSpacing: 0.75,
fontWeight: FontWeight.w600,
);

class TExtButton extends StatelessWidget {
  TExtButton();
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child:Text('Shows data StateWise',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          fontStyle: FontStyle.normal,
          decoration: TextDecoration.underline,
          letterSpacing: 0.75,
          //  color: Color(0xFF0066FF),
        ),
      ),
      onPressed: ()
      {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CovidStatsData()),
        );
      },
    );
  }
}

class RowElements extends StatelessWidget {
  RowElements({required this.cl, required this.title});
  final Color cl;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 5,
          height: 5,
          color: cl,
        ),
        Text(title,style: TextStyle(
          color: Colors.black,
          fontSize: 10,
          letterSpacing: 0.75,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
        ),)
      ],
    );
  }
}
class PieChart extends StatelessWidget {
  PieChart({required this.radius});
  final String radius;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      //mainAxisAlignment: MainAxisAlignment.center,
      alignment: WrapAlignment.center,
      children:[
        Padding(
          padding:EdgeInsets.fromLTRB(30, 0, 10, 0),
          child:SfCircularChart(
            series: <PieSeries<chartData1, String>>[
              PieSeries<chartData1, String>(
                // Assign the chartData to the data source.
                selectionBehavior: SelectionBehavior(enable: true),
                // explode: true,
                dataSource: chartData,
                pointColorMapper:(chartData1 data, _) => data.clr,
                xValueMapper: (chartData1 data, _) => data.title,
                yValueMapper: (chartData1 data, _t) => data.x,
                name:'Cases',
                radius: radius,
                dataLabelMapper: (chartData1 data, _) => data.title+'\n'+ data.x.toString(),
                dataLabelSettings: DataLabelSettings(isVisible: true),
              ),
            ],
          ),
        ),
        Padding(
          padding:EdgeInsets.fromLTRB(5, 0, 5, 0),
          //padding:EdgeInsets.fromLTRB(20, 0, 10, 0),
          child:Container(
            child: Column(
              children: [
                RowElements(cl:Color(0xFF6E7191),title:' TotalCases ',),
                RowElements(cl:Color(0xFF0066FF),title:' ActiveCases',),
                RowElements(cl:Color(0xFF05E945),title:'  Recovered ',),
                RowElements(cl:Color(0xFFFF0000),title:'  Deaths       ',),
              ],
            ),
          ),
        ),
        SizedBox(height: 50,),
      ],
    );
  }
}