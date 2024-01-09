import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:luzergia_solar_app/styles/app_styles.dart';
import 'package:luzergia_solar_app/widgets/indicator.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        AspectRatio(
          aspectRatio: 1.9,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              sections: showingSections(),
            ),
          ),
        ),
        _buildLegend(),
      ],
    );
  }

  Widget _buildLegend() {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Indicator(
            color: AppStyles.mindAro,
            text: 'First',
            isSquare: true,
          ),
          Indicator(
            color: AppStyles.pantone3,
            text: 'Second',
            isSquare: true,
          ),
          Indicator(
            color: AppStyles.pantone2,
            text: 'Third',
            isSquare: true,
          ),
          Indicator(
            color: AppStyles.pantone4,
            text: 'Fourth',
            isSquare: true,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 20.0;
      final radius = isTouched ? 50.0 : 55.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppStyles.pantone1,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppStyles.pantone5,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: AppStyles.celticBlue,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppStyles.pantone5,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: AppStyles.pantone5,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppStyles.celticBlue,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: AppStyles.ashGrey,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: AppStyles.pantone1,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
