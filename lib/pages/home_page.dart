import 'package:flutter/material.dart';

import '../model/post_model.dart';
import '../server/http_service.dart';
import '../server/log_service.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String data = "";

  @override
  void initState() {
    super.initState();

    var post = Post(name: 'test',salary: 100,age: 19);
    // _apiPostList();
    // _apiPostList2();
     _apiPostCreate(post);
    // _apiPostUpdate(post);
    // _apiPostDelete(post);
  }


  void _apiPostList(){
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      print(response),
      _showResponse(response!),
     // LogService.i(response)

    });
  }
  void _apiPostList2(){
    Network.GET(Network.API_LIST2, Network.paramsEmpty()).then((response) =>
    {
      print(response.toString()),
      _showResponse(response!),
     // LogService.i(response)
    });
  }
  void _showResponse(String response){
    setState(() {
      data = response;
    });
  }

  void _apiPostCreate(Post post){
    Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((response) =>
    {
      _showResponse(response!),
      LogService.i(response)
    });
  }

  void _apiPostUpdate(Post post){
    Network.PUT(Network.API_UPDATE + post.name.toString(),Network.paramsUpdate(post)).then((response) =>
    {
      _showResponse(response!),
     // LogService.i(response)
    });
  }

  void _apiPostDelete(Post post){
    Network.DEL(Network.API_DELETE + post.name.toString(),Network.paramsEmpty()).then((response) =>
    {
      _showResponse(response!),
      //LogService.i(response)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data != null ? data : "No Data"),
      ),
    );
  }
}
