import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    required this.day,
    required this.status,
    required this.asset,
    super.key,
  });
  final String day;
  final String status;
  final String asset;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: context.padding.low,
        child: Column(
          children: [
            Expanded(
              child: Text(
                day,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(child: Image.asset(asset)),
            Expanded(
              child: Text(
                status,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
