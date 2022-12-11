import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:stem_project/components/styles.dart';
import 'package:charts_flutter_new/flutter.dart' as charts ;
import 'package:stem_project/models/bar_models.dart';

import 'components/reusable_components.dart';
import 'network/dio_helper.dart';
class BarChart extends StatefulWidget {



  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
   @override
  void initState() {
    // TODO: implement initState
    /* DioHelper.getData(path: 'channels/902280/fields/1.json' , queryParameters: {
       "results":"10"
     }).then((value) {
       temperatureSoil = BarModel.fromJson(value.data);
       print('json : ${value.data.toString()}');
       getTemperatureCount(temperatureSoil!);
       setState(() {

       });
       print("Temperature Count : $temperatureCount");
     });*/
      getDataFromThingsSpeak();
     super.initState();
  }
   BarModel? temperatureSoil;

   Map<String,int> temperatureCount = {};

  List<charts.Series<Feed,String>> _createSampleData(){
    /*final data = [
      BarModel2("2016" , 20),
      BarModel2("2017" , 23),
      BarModel2("2018" , 29),
      BarModel2("2019" , 32),
    ];*/


    return [
      charts.Series<Feed , String>(data: temperatureSoil!.feeds ,
          id:"salles" ,
          colorFn: (_,__)=> charts.MaterialPalette.blue.shadeDefault.lighter ,
          displayName: 'Temperature',

          domainFn: (Feed barmodel , _) =>  barmodel.field1,
          measureFn: (Feed barmodel , _) => num.parse(temperatureCount['${barmodel.field1}']!.toInt().toString())
      )
    ];
  }

   List<charts.Series<Feed,String>> _createSampleData2(){
     /*final data = [
      BarModel2("2016" , 20),
      BarModel2("2017" , 23),
      BarModel2("2018" , 29),
      BarModel2("2019" , 32),
    ];*/


     return [
       charts.Series<Feed , String>(data: temperatureSoil!.feeds ,
           id:"salles" ,
           colorFn: (_,__)=> charts.MaterialPalette.red.shadeDefault.lighter ,
           displayName: 'Temperature',

           domainFn: (Feed barmodel , _) =>  barmodel.field2!,
           measureFn: (Feed barmodel , _) => num.parse(temperatureCount['${barmodel.field1}']!.toInt().toString())
       )
     ];
   }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
     appBar: AppBar(
        backgroundColor: const Color(0xff2c4260),
        title: Text('Garduino' , style: defaultTextStyle() ),


       actions: [
         Container(
           margin: EdgeInsets.only(
             right: 10,
           ),
           child: IconButton(
             onPressed: (){
               getDataFromThingsSpeak();
             },
             icon: const Icon(
                 Icons.sync ,
               color: Colors.white,
               size: 25,

             ),
           ),
         )
       ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10.0 ,
          vertical: 10.0
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              defaultHeader("Temperature"),
              Container(
                height: 350 ,
                child: temperatureSoil != null ?charts.BarChart(
                  _createSampleData(),
                ): const Center(child: CircularProgressIndicator()) ,
              ),
              const SizedBox(
                height: 20,
              ),
              defaultHeader("Soil Moisture"),
              Container(
                height: 350 ,
                child: temperatureSoil != null ?charts.BarChart(
                  _createSampleData2(),
                ): const Center(child: CircularProgressIndicator()) ,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getTemperatureCount(BarModel model){
    model.feeds.forEach((element) {
      if(! temperatureCount.containsKey(element.field1)) {
        var temp = model.feeds.where((value) => value.field1 == element.field1).length;
        temperatureCount[element.field1] = temp ;
      }
    });
  }
  void getDataFromThingsSpeak(){
    setState(() {
      temperatureSoil = null;

    });
    /*1950919*/
    /*902280*/
    DioHelper.getData(path: 'channels/902280/fields/1.json' , queryParameters: {
      "results":"10"
    }).then((value) {
      temperatureSoil = BarModel.fromJson(value.data);
      print('json : ${value.data.toString()}');
      getTemperatureCount(temperatureSoil!);
      setState(() {

      });
      print("Temperature Count : $temperatureCount");
    });
  }
}
