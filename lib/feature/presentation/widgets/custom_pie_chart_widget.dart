import 'package:flutter_ocr_verifik/utils/export_files.dart';

class LivenessScoreChart extends StatelessWidget {
  const LivenessScoreChart({
    super.key,
    required this.score,
    required this.title,
    required this.roundedScore,
  });

  final String title;
  final String score;
  final double roundedScore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            decoration: TextDecoration.underline,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 200,
          height: 200,
          child: PieChart(
            totalValue: 100,
            colorList: const [Colors.indigo],
            baseChartColor: Colors.grey[100] ?? Colors.grey,
            chartValuesOptions: const ChartValuesOptions(
              showChartValues: false,
            ),
            centerWidget: Text(
              score,
              style: const TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            legendOptions: const LegendOptions(showLegends: false),
            chartType: ChartType.ring,
            dataMap: {'1': roundedScore},
          ),
        ),
      ],
    );
  }
}
