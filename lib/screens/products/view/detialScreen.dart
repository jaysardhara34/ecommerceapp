import 'package:ecommerceapp/screens/products/provider/homeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({Key? key}) : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  ProductProvider? protrue;
  ProductProvider? profalse;

  @override
  Widget build(BuildContext context) {
    protrue = Provider.of<ProductProvider>(context, listen: true);
    profalse = Provider.of<ProductProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xff000000)),
        elevation: 00,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                  colors: [
                Color(0xff9a6c34),
                Color(0xfffa991c),
              ])),
        ),
        title: Text(
          '${profalse!.click!.category}',
          style: TextStyle(color: Color(0xff000000)),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '${profalse!.click!.id}.',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 45,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 250,
                  width: 250,
                  child: Image.network('${profalse!.click!.image}'),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Price :',
                          style: TextStyle(
                            color: Color(0xff707070),
                            fontSize: MediaQuery.of(context).size.height / 45,
                          ),
                        )),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      '${profalse!.click!.price} \$',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 40,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Ratings :',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height / 45,
                            color: Color(0xff707070),
                          ),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '${profalse!.click!.rating!.rate} ★',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 40,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Item name :',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 45,
                          color: Color(0xff707070)),
                    )),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '${profalse!.click!.title}',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 40,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Description:',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height / 45,
                          color: Color(0xff707070)),
                    )),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '${profalse!.click!.description}',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 40,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
