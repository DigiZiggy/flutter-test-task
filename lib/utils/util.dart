import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../colors.dart';
import '../models/article.dart';
import '../models/instrument.dart';

class Util {

  static void sortArticlesByPublishTime(items) {
    items.sort((Article a, Article b) {
      var aPublishTime = a.publishTime;
      var bPublishTime = b.publishTime;
      return bPublishTime.compareTo(aPublishTime);
    });
  }

  static Text generateRandomPrice() {
    int random = Random().nextInt(2);
    String icon = '\u2191';
    Color colour = LightyearColors.positiveDark;
    if (random == 1) {
      icon = '\u2193';
      colour = LightyearColors.negativeDark;
    }
    return Text(icon + getRandomDoubleStr() + "%",
        style: TextStyle(
            color: colour),
        textAlign: TextAlign.left
    );
  }

  static String getRandomDoubleStr() {
    double random = Random().nextDouble();
    return random.toString().substring(0, 4);
  }

  static String getHHmmFromDateTimeStr(dateTimeStr) {
    DateTime parsedDate = DateTime.parse(dateTimeStr);
    return DateFormat.Hm().format(parsedDate);
  }

  static Instrument getInstrumentById(id, instrumentsList) {
    return instrumentsList.firstWhere((instrument) => instrument.id == id);
  }

  static Map<String, List<Article>> getArticlesByDate(List<Article> articlesList) {
    Map<String, List<Article>> groupedByDateList = <String, List<Article>>{};
    for (var article in articlesList) {
      DateTime dateTime = DateTime.parse(article.publishTime);
      String dateStr = DateFormat('dd MMM yyyy').format(dateTime);
      if (groupedByDateList.containsKey(dateStr)) {
        List<Article> sameDayArticles = groupedByDateList[dateStr]!;
        sameDayArticles.add(article);
        groupedByDateList.update(dateStr, (value) => sameDayArticles);
      } else {
        groupedByDateList.putIfAbsent(dateStr, () => <Article>[article]);
      }
    }
    return groupedByDateList;
  }
}