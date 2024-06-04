import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class LinesView extends StatelessWidget {
  const LinesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child:  Column(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.withOpacity(.2)
                ),
                  child: Stack(
                    children: [Sparkline(
                      lineColor: Colors.red,
                        data: [1,5,9,2,5,4,6,9,10,1]),
                      Sparkline(
                        lineColor: Colors.blueAccent,
                          averageLine: true,
                          data: [11,52,9,20,5,4,16,29,10,16])
                    ],

                  )),
              SizedBox(height: 50,),
              CircularCountDownTimer(width: 60,
                  height: 60,
                  duration: 10,
isReverse: true,
                  textFormat: CountdownTextFormat.MM_SS,
                  fillColor:Colors.indigo ,
                  ringColor:Colors.deepOrange.withOpacity(.2) )
            ],
          ),
        )
      ),
    );
  }
}
