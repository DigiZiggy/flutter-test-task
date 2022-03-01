import 'package:flutter/material.dart';

import '../colors.dart';
import '../models/article.dart';
import '../models/instrument.dart';
import '../utils/util.dart';

Widget customListTile(Article article, Instrument instrument, BuildContext context) {
  return InkWell(
    child: Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(instrument.symbol,
                                style: const TextStyle(color: LightyearColors.gray3),
                                textAlign: TextAlign.left),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Util.generateRandomPrice(),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10, top: 10, right: 10),
                          child: Text(article.title,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ]),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Text(instrument.name,
                              style: const TextStyle(color: LightyearColors.gray3),
                              textAlign: TextAlign.left),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text('\u2022',
                              style: TextStyle(color: LightyearColors.gray3),
                              textAlign: TextAlign.left),
                        ),
                        Text(Util.getHHmmFromDateTimeStr(article.publishTime),
                            style: const TextStyle(color: LightyearColors.gray3),
                            textAlign: TextAlign.left)
                      ],
                    )
                  ],
                )
              ),
              Container(
                height: 70.0,
                width: 70.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(article.imageUrl),
                      fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              )
            ]
          )
        ],
      ),
    ),
  );
}