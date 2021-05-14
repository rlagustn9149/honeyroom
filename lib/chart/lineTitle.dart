import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        topTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            // 무슨아파트인지 아파트 명을 title로 보여주기 미구현
            getTitles: (value) {
              return '';
            }),
        rightTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            getTitles: (value) {
              return '';
            }),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 50000:
                return '5억';
              case 100000:
                return '10억';
              case 150000:
                return '15억';
              case 200000:
                return '20억';
              case 250000:
                return '25억';
              case 300000:
                return '30억';
            }
            return '';
          },
          reservedSize: 38,
          margin: 30,
        ),
      );
}
