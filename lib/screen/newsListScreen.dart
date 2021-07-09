import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/model/newsModel.dart';

class NewsListScreen extends StatelessWidget {
  final Articles _articles;

  NewsListScreen(this._articles);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            _articles.source.name,
            style: GoogleFonts.noticiaText(),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.28,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  child: Image.network(
                    _articles.urlToImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    _articles.title,
                    style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
                  )),
              Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    _articles.description,
                    style: GoogleFonts.lato(color: Colors.grey, fontSize: 20),
                  )),
              Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    _articles.author,
                    style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
                  )),
            ],
          ),
        ));
  }
}
