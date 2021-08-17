import 'package:flutter/material.dart';
import 'package:flutter_build_value/models/post_model.dart';
import 'services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Build Value',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> post = [];
  ApiService apiService = ApiService();

  @override
  void initState() {
    apiService.getPosts().then((value) {
      setState(() {
        post = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Build value sample"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: post.length,
            itemBuilder: (context, index) {
              return buildPostTile(post[index]);
            }),
      ),
    );
  }

  buildPostTile(Post post) {
    return ListTile(
      leading: !post.thumbnail.contains(".jpg")
          ? CircleAvatar(
              child: Image.network(
              post.thumbnail,
              scale: 0.2,
            ))
          : CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person),
            ),
      title: Text('Title: ${post.title} by ${post.author}'),
      subtitle: Text(
        'Subtitle: ${post.subreddit} with ${post.ups} upvotes',
      ),
    );
  }
}
