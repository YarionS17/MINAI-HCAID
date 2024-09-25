import 'package:flutter/material.dart';
import 'package:minai_hcaid/models/article.dart';
import 'package:minai_hcaid/models/constant.dart';

class TrendingArticles extends StatelessWidget {
  const TrendingArticles({super.key, required this.selectArticle});

  final Function selectArticle;

  @override
  Widget build(BuildContext context) {

    final List<Article> trendingArticles = articles.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Trending",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: trendingArticles.length,
            itemBuilder: (context, index) {
              final article = trendingArticles[index];
              return ListTile(
                contentPadding: const EdgeInsets.all(4.0),
                leading: Image.network(
                  article.thumbnailUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  article.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  selectArticle(article);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}