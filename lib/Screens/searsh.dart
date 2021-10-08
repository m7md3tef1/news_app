
import 'package:appnew/Models/NewsModel.dart';
import 'package:appnew/Widgets/SmartCodeTitle.dart';
import 'package:appnew/api-helper/api_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart'as http;
class SearchScreen extends StatefulWidget {

  String categoryName;
  SearchScreen({this.categoryName});
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<NewsModel> articlee = [];
  ApiHelper apiHelpers = ApiHelper();
  Future<List<NewsModel>> getNewsByCategory(category) {
    apiHelpers.getNewsByCategory(widget.categoryName).then((value) {
      setState(() {
        articlee = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: SmartCodeTitle(),
      ),
      body: Column(
        children: [
           Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onFieldSubmitted: (v)async
                {
                  await getNewsByCategory(v);
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,

                    ),
                    labelText: 'Search Here',
                  labelStyle: TextStyle(fontSize: 15.sp),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))

                    ),
              ),
            ),
             Expanded(child: Center(
               child: Image.network('https://th.bing.com/th/id/OIP.IQdToehA6_ucmG83vZrlowHaHa?pid=ImgDet&rs=1'),
             )),
        ],
      ),
    );
  }
}

