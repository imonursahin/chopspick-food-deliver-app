import 'package:chopspick/model/OrderData.dart';
import 'package:chopspick/views_model/Home/OrderService.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../../model/ProductData.dart';
import '../../../views_model/Home/ProductDetailService.dart';

class CartPage extends StatefulWidget {
  final ProductData product;
  final int quantity;
  final OrderData orderData;

  const CartPage(this.product, this.quantity, this.orderData, {Key? key})
      : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late Size size = MediaQuery.of(context).size;
  TextEditingController _controller = TextEditingController();

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
                  "${widget.orderData.orderItem.length} " + "items in Cart",
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

  Widget buildProductDetails() {
    return Column(
        children: List.generate(widget.orderData.orderItem.length, (index) {
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
            onPressed: () {
              removeItem(index);
            },
          ),
        ],
      );
    }));
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
      Image.network(widget.product.url),
    ]);
  }

  Column buildProductInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.product.name,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 23)),
        Text("\$" + "${widget.product.price}",
            style: TextStyle(
                color: Color(0xffB4AC03),
                fontWeight: FontWeight.bold,
                fontSize: 23)),
        Consumer<ProductDetailService>(builder: (context, data, child) {
          return Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_circle_down_rounded,
                  size: 25,
                ),
                color: Color(0xffCC1A74),
                onPressed: () {
                  data.downQuantity();
                },
              ),
              Text(
                data.quantity.toString(),
                style: TextStyle(color: Colors.black),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_circle_up_rounded,
                  size: 25,
                ),
                color: Color(0xffCC1A74),
                onPressed: () {
                  data.upQuantity();
                },
              ),
            ],
          );
        })
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
      controller: _controller,
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

  Widget buildTotalPrice() {
    return Consumer<ProductDetailService>(builder: (context, data, child) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total:",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 23)),
            Text("\$" + "${data.showQuantity() * widget.product.price}",
                style: TextStyle(
                    color: Color(0xffB4AC03),
                    fontWeight: FontWeight.bold,
                    fontSize: 23)),
          ],
        ),
      );
    });
  }

  Container buildCheckoutBTTN(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      height: 50,
      width: size.width * 0.8,
      child: Consumer<OrderService>(builder: (context, data, child) {
        return ElevatedButton(
          onPressed: () async {
            try {
              await data
                ..addOrder(OrderData(
                        orderItem: [
                      /* OrderItem(quantity: widget.quantity, product:[""]) */
                    ],
                        description: _controller.text,
                        totalPrice: widget.quantity * widget.product.price))
                    .then((value) {
                  Fluttertoast.showToast(msg: "Eklendi");
                });
            } catch (error) {
              String msg = "Hata";
              Fluttertoast.showToast(msg: msg);
            }
          },
          child: const Text(
            'Checkout',
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
              primary: Color(0xffCC1A74),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24))),
        );
      }),
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

  void removeItem(int index) {
    setState(() {
      widget.orderData.orderItem = List.from(widget.orderData.orderItem)
        ..removeAt(index);
    });
  }
}
