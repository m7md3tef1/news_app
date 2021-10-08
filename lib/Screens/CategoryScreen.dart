import 'package:appnew/Models/CategoryModel.dart';
import 'package:appnew/Widgets/SmartCodeTitle.dart';
import 'package:flutter/material.dart';
import 'package:appnew/Models/NewsModel.dart';
import 'package:appnew/api-helper/api_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatefulWidget {

  String categoryName;
  CategoryScreen({this.categoryName});
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
  void initState() {
    super.initState();
    getNewsByCategory(CategoryModel);
  }

  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(

          backgroundColor: Colors.grey[300],
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SmartCodeTitle(),
          ),
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size(90.h, 90.w),
            child: Container(
              height: 100.h,
              width: 1.sw,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      widget.categoryName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: articlee.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: 1.sw,
                    height: .41.sh,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              articlee[index].imageUrl == null
                                  ? 'https://th.bing.com/th/id/OIP.IQdToehA6_ucmG83vZrlowHaHa?pid=ImgDet&rs=1'
                                  : articlee[index].imageUrl,
                            ))),
                  ),
                );
              }),
        ));
  }
}
