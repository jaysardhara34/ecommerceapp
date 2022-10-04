import 'package:ecommerceapp/screens/products/modal/ProductModal.dart';
import 'package:ecommerceapp/screens/products/provider/homeProvider.dart';
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
                                fontSize: 18,
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
                  "Welcome To The Ghatiyazon Our new Ecommerce App",
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
      body: Column(
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
                        return Container(
                          height: 180,
                          width: 170,
                          margin: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    '${listdata[index].image}',
                                    height: 110,
                                    width: 87,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text('${listdata[index].price} \$'),
                                      Text('${listdata[index].rating!.rate} ★'),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text('${listdata[index].title}',
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis)),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
                return CircularProgressIndicator();
              })
        ],
      ),
    ));
  }
}
