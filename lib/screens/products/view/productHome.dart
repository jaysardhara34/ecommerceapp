import 'dart:io';

import 'package:ecommerceapp/screens/products/modal/ProductModal.dart';
import 'package:ecommerceapp/screens/products/provider/homeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductProvider? protrue;
  ProductProvider? profalse;

  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).getUserData();
  }

  @override
  Widget build(BuildContext context) {
    protrue = Provider.of<ProductProvider>(context, listen: true);
    profalse = Provider.of<ProductProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff000000)),
        actions: [
          IconButton(
            onPressed: () {
              protrue!.getUserData();
            },
            icon: Icon(Icons.refresh),
            color: Color(0xff000000),
          ),
          SizedBox(
            width: 5,
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  onTap: () {
                    profalse!.filter1();
                  },
                  child: Text("0 - 49\$ Price"),
                ),
                PopupMenuItem(
                  onTap: () {
                    profalse!.filter2();
                  },
                  child: Text("50 - 99\$ Price"),
                ),
                PopupMenuItem(
                  onTap: () {
                    profalse!.filter3();
                  },
                  child: Text("Over 100\$ Price"),
                ),
              ];
            },
            icon: Icon(Icons.more_vert_rounded),
          )
        ],
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
          'Ghatiyazon',
          style: TextStyle(color: Color(0xff000000)),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: 125,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        end: Alignment.bottomCenter,
                        begin: Alignment.topCenter,
                        colors: [
                          Color(0xfffa991c),
                          Color(0xff6b481f),
                        ]),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Color(0xff000000),
                                  size: 20,
                                )),
                          ),
                          Text(
                            "Hi, Jack Sardhara Par....",
                            style: TextStyle(
                                color: Color(0xff131313),
                                fontSize: MediaQuery.of(context).size.height/42,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "7041648493    |   Ghatiyazon App",
                            style: TextStyle(color: Color(0xff000000)),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8, bottom: 8),
                        height: 1,
                        width: double.infinity,
                        color: Colors.black54,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.settings,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Profile & Settings",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Hy ${Provider.of<ProductProvider>(context,listen: true).value}Welcome To The Ghatiyazon Our new Ecommerce App",
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("           ~Inspired by Vidit Savaliya"),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: dialog,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome To The Ghatiyazon',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xffaf6906),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FutureBuilder(
                future: profalse!.getUserData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    Text('${snapshot.error}');
                  } else if (snapshot.hasData) {
                    List listdata = snapshot.data!;
                    return Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: listdata.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              profalse!.click = ProductModal(
                                image: '${listdata[index].image}',
                                id: listdata[index].id,
                                title: '${listdata[index].title}',
                                price: listdata[index].price,
                                description: '${listdata[index].description}',
                                rating: listdata[index].rating,
                                category: listdata[index].category,
                              );
                              Navigator.pushNamed(context, 'item');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all()),
                              margin: EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(
                                    '${listdata[index].image}',
                                    height:
                                        MediaQuery.of(context).size.height / 10.37,
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${listdata[index].price} \$',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                30),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          '${listdata[index].title}',
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  33),
                                        ),
                                      )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '${listdata[index].rating!.rate} ★',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                30),
                                  ),

                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return CircularProgressIndicator(
                    color: Color(0xffe05c28),
                    backgroundColor: Color(0xffd0ad9f),
                  );
                })
          ],
        ),
      ),
    ));
  }

  Future<bool> dialog() async {
    back();
    return await false;
  }

  void back() {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Text(
              '!! Are You Sure? \n You Want to Quit !!',
              style: TextStyle(fontSize: 16),
            ),
            actions: [
              CupertinoButton(
                  child: Text(
                    'Yes',
                    style: TextStyle(color: Color(0xffff0000)),
                  ),
                  onPressed: () {
                    exit(0);
                  }),
              CupertinoButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          );
        });
  }
}
