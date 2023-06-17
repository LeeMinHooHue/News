import 'package:flutter/material.dart';
import 'package:ui_login/newsDetail.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: ListView.builder(
        itemCount: 10, // Số lượng bài viết
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.article),
              title: Text('Article Title $index'),
              subtitle: Text('Article Description $index'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsDetailScreen(index: index),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
