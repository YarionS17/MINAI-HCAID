import 'package:flutter/material.dart';
import 'package:minai_hcaid/models/article.dart';
import 'package:minai_hcaid/models/constant.dart';
import 'package:minai_hcaid/src/article_list.dart';
import 'package:minai_hcaid/src/trending_articles.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Article? selectedArticle;

  void onArticleTap(Article article) {
    setState(() {
      selectedArticle = article;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cool News Website'),
          bottom: TabBar(
            isScrollable: true,
            tabs: categories.map((category) {
              return Tab(text: category);
            }).toList(),
          ),
        ),
        body: Row(
          children: [

            Expanded(
              flex: 3,
              child: TabBarView(
                children: categories.map((category) {
                  return selectedArticle == null
                      ? ArticleList(
                    category: category,
                    onArticleTap: onArticleTap,
                  )
                      : ArticleDetail(
                    article: selectedArticle!,
                    onBack: () {
                      setState(() {
                        selectedArticle = null;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            const VerticalDivider(),
            Expanded(
              flex: 1,
              child: Container(
                //color: Colors.grey[200],
                padding: const EdgeInsets.all(8.0),
                child: TrendingArticles(selectArticle: onArticleTap),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

