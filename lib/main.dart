import 'package:flutter/material.dart';
import 'package:newsapp/components/customListTile.dart';
import 'package:newsapp/model/article.dart';
import 'package:newsapp/services/api_services.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("News App", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot){
          print(snapshot);
          if (snapshot.hasData){

            List<Article>? articles = snapshot.data;
            return ListView.builder(

                itemCount: articles!.length,
            itemBuilder: (context, index) => customListTile(articles [index],context)
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}