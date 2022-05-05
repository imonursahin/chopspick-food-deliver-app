 import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Size size = MediaQuery.of(context).size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "1 items in Cart",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
              buildProductDetails(),
              SizedBox(height: 24),
              buildNoteTitle(),
              SizedBox(height: 12),
              buildNoteTF(),
              SizedBox(height: 36),
              buildTotalPrice(),
              buildCheckoutBTTN(context),
              buildMenuBTTN()
            ]),
          ),
        ),
      ),
    );
  }

  Row buildProductDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildProductIMG(),
        buildProductInfo(),
        IconButton(
          icon: Icon(
            Icons.cancel_outlined,
            size: 25,
          ),
          color: Color(0xffEC0808),
          onPressed: () {},
        ),
      ],
    );
  }

  Stack buildProductIMG() {
    return Stack(alignment: Alignment.center, children: [
      Container(
        margin: EdgeInsets.only(top: 18),
        height: 140,
        width: 140,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 235, 235, 240),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      Image.asset("assets/img/gelato.png"),
    ]);
  }

  Column buildProductInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Gelato",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 23)),
        Text("\$30",
            style: TextStyle(
                color: Color(0xffB4AC03),
                fontWeight: FontWeight.bold,
                fontSize: 23)),
        Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_circle_down_rounded,
                size: 25,
              ),
              color: Color(0xffCC1A74),
              onPressed: () {},
            ),
            Text(
              "1",
              style: TextStyle(color: Colors.black),
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_circle_up_rounded,
                size: 25,
              ),
              color: Color(0xffCC1A74),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  Container buildNoteTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text("Order Instructions",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20)),
    );
  }

  TextFormField buildNoteTF() {
    return TextFormField(
      keyboardType: TextInputType.text,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff494747)),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff494747)),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
      ),
      maxLines: 5,
    );
  }

  Container buildTotalPrice() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Total:",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 23)),
          Text("\$30",
              style: TextStyle(
                  color: Color(0xffB4AC03),
                  fontWeight: FontWeight.bold,
                  fontSize: 23)),
        ],
      ),
    );
  }

  Container buildCheckoutBTTN(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      height: 50,
      width: size.width * 0.8,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartPage()),
          );
        },
        child: const Text(
          'Checkout',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
            primary: Color(0xffCC1A74),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24))),
      ),
    );
  }

  Container buildMenuBTTN() {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: TextButton(
          child: Text(
            'Back to Menu',
            style: TextStyle(
                fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          onPressed: () {}),
    );
  }
}