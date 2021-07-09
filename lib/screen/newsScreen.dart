import 'package:flutter/material.dart';
import 'package:news_app/providers/newsProvider.dart';
import 'package:provider/provider.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';

import 'newsDetailScreen.dart';
import 'newsListScreen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  PageController _controller = PageController(
    initialPage: 0,
  );

  var isLoading = true;

  @override
  void initState() {
    super.initState();
    Provider.of<NewsProvider>(context, listen: false)
        .getNewsList()
        .then((value) => {
              setState(() {
                isLoading = false;
              })
            });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Consumer<NewsProvider>(
              builder: (ctx, news, _) => TikTokStyleFullPageScroller(
                contentSize: news.articles.length,
                swipePositionThreshold: 0.2,
                swipeVelocityThreshold: 2000,
                animationDuration: const Duration(milliseconds: 300),
                builder: (ctx, index) {
                  return PageView(
                    controller: _controller,
                    children: [
                      NewsListScreen(news.articles[index]),
                      NewsDetailScreen(news.articles[index].url),
                    ],
                  );
                },
              ),
            ),
    );
  }
}
