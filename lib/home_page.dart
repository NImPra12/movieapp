import 'package:flutter/material.dart';
import 'package:movie_app/data_service.dart';
import 'package:movie_app/models.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _nameController = TextEditingController();
  var _dataService = DataService();
  MovieResponse? _response;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green.shade400,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_response != null)
              Card(
                child: ListTile(
                  title: Text(_response!.movieInfo.title),
                  leading: CircleAvatar(
                    child: Image.network(_response!.posterUrl),
                  ),
                ),
              ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  labelText: 'Movie Title',
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: "Enter Movie Title"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                onPressed: _search,
                icon: Icon(Icons.search),
                label: Text("Search"))
          ],
        ));
  }

  void _search() async {
    final response = await _dataService.getMovie(_nameController.text);
    setState(() {
      _response = response;
    });
  }
}
