import 'package:blog/src/diary/helper.dart';
import 'package:flutter/material.dart';

class WeeklyForecastScreen extends StatelessWidget {
  const WeeklyForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WeeklyForecastList(),
    );
  }
}

class WeeklyForecastList extends StatelessWidget {
  const WeeklyForecastList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime currentDate = DateTime.now();
    final TextTheme textTheme = Theme.of(context).textTheme;
    final List<DailyForecast> forecasts = Server.getDailyForecastList();

    return SingleChildScrollView(
        child: Column(
      children: forecasts.map((DailyForecast dailyForecast) {
        return Card(
          child: ListTile(
            leading: Text(
              dailyForecast.getDate(currentDate.day).toString(),
              style: textTheme.headline4,
            ),
            title: Text(
              dailyForecast.getWeekday(currentDate.weekday),
              style: textTheme.headline5,
            ),
            subtitle: Text(dailyForecast.description),
            trailing: Text(
              '${dailyForecast.highTemp} | ${dailyForecast.lowTemp} F',
              style: textTheme.subtitle2,
            ),
          ),
        );
      }).toList(),
    ));
  }
}
