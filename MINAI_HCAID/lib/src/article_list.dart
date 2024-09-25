import 'package:flutter/material.dart';
import 'package:minai_hcaid/models/article.dart';
import 'package:minai_hcaid/models/constant.dart';

class ArticleList extends StatelessWidget {
  final String category;
  final Function(Article) onArticleTap; // Callback when an article is tapped

  ArticleList({required this.category, required this.onArticleTap});

  @override
  Widget build(BuildContext context) {
    final categoryArticles = articles.where((article) => article.category == category).toList();

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: categoryArticles.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Number of cards per row
        crossAxisSpacing: 8, // Space between columns
        mainAxisSpacing: 8, // Space between rows
        childAspectRatio: 0.75, // Aspect ratio of the card
      ),
      itemBuilder: (context, index) {
        final article = categoryArticles[index];
        return GestureDetector(
          onTap: () {
            onArticleTap(article); // Notify the parent widget (HomePage)
          },
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  article.thumbnailUrl,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  right: 8,
                  child: Text(
                    article.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ArticleDetail extends StatelessWidget {
  final Article article;
  final VoidCallback onBack; // Callback to go back to the list

  ArticleDetail({required this.article, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: onBack, // Go back to the list
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Image.network(article.thumbnailUrl),
                  SizedBox(height: 16),
                  Text(
                    article.content,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}