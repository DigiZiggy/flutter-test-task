import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../components/customListTile.dart';
import '../models/article.dart';
import '../models/instrument.dart';
import '../services/api_service.dart';
import '../utils/util.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
            title: const Text("MSFT News", style: TextStyle(color: LightyearColors.white)),
            backgroundColor: LightyearColors.primaryMain,
            bottomOpacity: 0.0,
            elevation: 0.0,
          )
      ),
      body: Container(
        child: FutureBuilder(
          future: Future.wait([client.getArticles(), client.getInstruments()]),
          builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              List<Article> articles = snapshot.data![0];
              List<Instrument> instruments = snapshot.data![1];
              Map<String, List<Article>> articlesByDate = Util.getArticlesByDate(articles);
              return ListView.builder(
                shrinkWrap: true,
                itemCount: articlesByDate.length,
                itemBuilder: (context, dateIndex) =>
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15, top: 30, left: 18),
                            child: Text(articlesByDate.keys.elementAt(dateIndex),
                                style: const TextStyle(
                                    color: LightyearColors.gray3,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700),
                                textAlign: TextAlign.left),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: articlesByDate[articlesByDate.keys.elementAt(dateIndex)]?.length,
                              itemBuilder: (context, index) =>
                                  customListTile(
                                      articlesByDate[articlesByDate.keys.elementAt(dateIndex)]![index],
                                      Util.getInstrumentById(articles[index].instrumentId, instruments),
                                      context
                                  )
                          )
                        ]
                    )
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
          color: Colors.white,
        ),
      ),
      backgroundColor: LightyearColors.primaryMain,
    );
  }
}
