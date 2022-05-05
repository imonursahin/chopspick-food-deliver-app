import 'package:chopspick/views/Panel/home/ProductDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../views_model/home/ProductService.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size size = MediaQuery.of(context).size;

  @override
  void initState() {
    super.initState();
    Provider.of<ProductService>(context, listen: false).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //top bar
              Padding(
                  padding: EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //top text
                        SizedBox(height: 8),
                        buildTopText(),
                        SizedBox(height: 12),
                        //search input
                        Center(child: buildSearchBar()),
                        SizedBox(height: 18),
                        // category
                        buildCategoryList(),
                        SizedBox(height: 18),

                        buildPromotionsBanner(),
                        SizedBox(height: 18),
                        buildPopularProducts(),
                      ])),
            ],
          ),
        ),
      ),
    );
  }

  Column buildPopularProducts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Most Popular",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        Consumer<ProductService>(builder: (context, data, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(data.getProductList.length, (index) {
              return Container(
                margin: EdgeInsets.only(top: 12),
                height: 190,
                width: size.width / 2.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: [Color(0xffded0d0), Color(0xffedecec)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: Image.network(data.getProductList[index].url)),
                      Text(data.getProductList[index].name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18)),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("\$" + "${data.getProductList[index].price}",
                                  style: TextStyle(
                                      color: Color(0xffB4AC03),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              IconButton(
                                icon: Icon(
                                  Icons.add_circle_sharp,
                                  size: 30,
                                ),
                                color: Color(0xff0F8D04),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductDetailPage(
                                            data.getProductList[index])),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
              );
            }),
          );
        }),
      ],
    );
  }

  SizedBox buildPromotionsBanner() {
    return SizedBox(
      height: 210,
      child: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            "Promotions",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 12),
          height: 175,
          width: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
              colors: [Color(0xffd83483), Color(0xff8660b7)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Today’s Offer",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 22,
                        color: Colors.white)),
                Text("Free Box of Fries",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.white)),
                Text("On all others above  200",
                    style: TextStyle(fontSize: 22, color: Colors.white)),
              ],
            ),
          ),
        ),
        Positioned(
            right: 0, top: 0, child: Image.asset('assets/img/patato.png')),
      ]),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      titleSpacing: 0.0,
      leading: IconButton(
          icon: new Image.asset('assets/img/pp.png'), onPressed: () {}),
      title: Text("HI, Kayla",
          style: TextStyle(color: Color(0xff463A3A), fontSize: 22)),
      actions: [
        Icon(
          Icons.notifications_none_outlined,
          size: 30,
          color: Colors.black,
        )
      ],
    );
  }

  Text buildTopText() {
    return Text("What do you want to order today?",
        style: TextStyle(fontWeight: FontWeight.w300));
  }

  Row buildCategoryList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Stack(alignment: Alignment.center, children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Color(0xffD21670),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              Image.asset("assets/img/all.png"),
            ]),
            Padding(padding: EdgeInsets.only(top: 12)),
            Text(
              "All",
              style: TextStyle(
                  color: Color(0xff969696),
                  fontSize: 20,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
        Column(
          children: [
            Stack(alignment: Alignment.center, children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 235, 235, 240),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              Image.asset("assets/img/brgr.png"),
            ]),
            Padding(padding: EdgeInsets.only(top: 12)),
            Text(
              "Burger",
              style: TextStyle(
                  color: Color(0xff969696),
                  fontSize: 20,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
        Column(
          children: [
            Stack(alignment: Alignment.center, children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 235, 235, 240),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              Image.asset("assets/img/pizza.png"),
            ]),
            Padding(padding: EdgeInsets.only(top: 12)),
            Text(
              "Pizza",
              style: TextStyle(
                  color: Color(0xff969696),
                  fontSize: 20,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
        Column(
          children: [
            Stack(alignment: Alignment.center, children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 235, 235, 240),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              Image.asset("assets/img/desert.png"),
            ]),
            Padding(padding: EdgeInsets.only(top: 12)),
            Text(
              "Dessert",
              style: TextStyle(
                  color: Color(0xff969696),
                  fontSize: 20,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ],
    );
  }

  TextField buildSearchBar() {
    return TextField(
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black45,
        ),
        hintText: "Search",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide.none),
        fillColor: Color.fromARGB(255, 235, 235, 240),
        filled: true,
      ),
    );
  }
}
