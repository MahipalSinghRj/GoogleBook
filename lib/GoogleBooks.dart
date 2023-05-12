import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:visibility/Models/BookResponse.dart';

class GoogleBooks extends StatefulWidget {
  const GoogleBooks({Key? key}) : super(key: key);

  @override
  State<GoogleBooks> createState() => _GoogleBooksState();
}

class _GoogleBooksState extends State<GoogleBooks> {
  BookResponse? response;
  bool isLoading=false;
  @override
  void initState() {
     super.initState();
     getBooks();
  }
  getBooks()async{
    setState(() {
      isLoading=true;
    });
    try{
      var url= Uri.parse("https://www.googleapis.com/books/v1/volumes?q=java");
       var response=await http.get(url);
       var responseStr=response.body;
       var decodedJsonStr= jsonDecode(responseStr) as Map<String, dynamic>;
       setState(() {
         this.response=BookResponse.fromJson(decodedJsonStr);
       });
    }catch(e){
      print(e);
      setState(() {
        isLoading=false;
      });
    }finally{
      setState(() {
        isLoading=false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Google Books ")),
      body: !isLoading?ListView.builder(
        itemCount:  response?.items?.length ?? 0,
          itemBuilder: (_, index){
            return ListTile(
              title: Text(response?.items![index].volumeInfo?.title ??""),
              subtitle: Text(response?.items![index].volumeInfo?.authors?.first ??""),
              leading: Image.network(response?.items![index].volumeInfo?.imageLinks?.thumbnail ??""),
            );
          }
      ):const Center(child: CircularProgressIndicator()),
    );
  }
}
