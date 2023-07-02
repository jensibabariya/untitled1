import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/data_entry.dart';
import 'package:untitled1/mycontroller.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  TextEditingController t1 = TextEditingController();
  MyController m = Get.put(MyController());
  List<Map> l = [];
  bool temp = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    m.get_Database();

  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        kToolbarHeight;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: (m.temp.value) ? TextField(autofocus: true,): Text(
          "Dashboard",
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          IconButton(onPressed: () {
            m.temp.value = true;

          }, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      // drawer: Drawer(
      //   child: Container(
      //     child: ListView(
      //       children: [
      //         Container(
      //           margin: EdgeInsets.all(10),
      //           height: 250,
      //           decoration: BoxDecoration(
      //               color: Colors.deepPurple,
      //               borderRadius: BorderRadius.circular(10)),
      //           child: Column(
      //             children: [
      //               Container(
      //                 margin: EdgeInsets.all(10),
      //                 height: 50,
      //                 width: 50,
      //                 decoration: BoxDecoration(
      //                     color: Colors.white, shape: BoxShape.circle),
      //                 child: Icon(Icons.account_circle_outlined),
      //               ),
      //               SizedBox(
      //                 height: 5,
      //               ),
      //               Container(
      //                 child: Text(
      //                   "Account Manager",
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 20,
      //                     decoration: TextDecoration.underline,
      //                   ),
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 10,
      //               ),
      //               Container(
      //                 alignment: Alignment.centerLeft,
      //                 padding: EdgeInsets.fromLTRB(20, 8, 0, 5),
      //                 child: Text(
      //                   "Credit(+)",
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 15,
      //                   ),
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 10,
      //               ),
      //               Container(
      //                 alignment: Alignment.centerLeft,
      //                 padding: EdgeInsets.fromLTRB(20, 8, 0, 5),
      //                 child: Text(
      //                   "Debit(-)",
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 15,
      //                   ),
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: 10,
      //               ),
      //               Container(
      //                 alignment: Alignment.centerLeft,
      //                 padding: EdgeInsets.fromLTRB(20, 8, 0, 5),
      //                 child: Text(
      //                   "Balance",
      //                   style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 15,
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         ListTile(
      //           leading: Icon(Icons.home),
      //           title: InkWell(
      //             onTap: () {},
      //             child: Container(
      //               height: 40,
      //               width: 80,
      //               alignment: Alignment.centerLeft,
      //               child: Text(
      //                 "Home",
      //                 style: TextStyle(color: Colors.black, fontSize: 15),
      //               ),
      //             ),
      //           ),
      //         ),
      //         ListTile(
      //           leading: Icon(Icons.backup),
      //           title: InkWell(
      //             onTap: () {},
      //             child: Container(
      //               height: 40,
      //               width: 80,
      //               alignment: Alignment.centerLeft,
      //               child: Text(
      //                 "Backup",
      //                 style: TextStyle(color: Colors.black, fontSize: 15),
      //               ),
      //             ),
      //           ),
      //         ),
      //         ListTile(
      //           leading: Icon(Icons.settings),
      //           title: InkWell(
      //             onTap: () {},
      //             child: Container(
      //               height: 40,
      //               width: 80,
      //               alignment: Alignment.centerLeft,
      //               child: Text(
      //                 "Settings",
      //                 style: TextStyle(color: Colors.black, fontSize: 15),
      //               ),
      //             ),
      //           ),
      //         ),
      //         ListTile(
      //           leading: Icon(Icons.logout),
      //           title: InkWell(
      //             onTap: () {},
      //             child: Container(
      //               height: 40,
      //               width: 80,
      //               alignment: Alignment.centerLeft,
      //               child: Text(
      //                 "Logout",
      //                 style: TextStyle(color: Colors.black, fontSize: 15),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      drawer: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Drawer(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 15),
                  height: height * .3,
                  width: width,
                  color: Colors.deepPurple,
                  child: Column(
                    children: [
                      // CircleAvatar(
                      //   backgroundColor: Colors.white,
                      //   maxRadius: width * .073,
                      //   child: CircleAvatar(
                      //     backgroundColor: Colors.purple.shade800,
                      //     maxRadius: width * .07,
                      //     child: Image(
                      //       image: AssetImage("images/document.png"),
                      //       width: height * .04,
                      //       height: height * .04,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // ),
                      IconButton(onPressed: () {

                      }, icon: Icon(Icons.account_circle,color: Colors.white,size: 35,)),
                      SizedBox(
                        height: height * .005,
                      ),
                      Text(
                        "Account Manager",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 7, right: 15, left: 15),
                        color: Colors.white,
                        height: height * .002,
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        height: height * .13,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.deepPurple[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Credit(+)",
                                  style: TextStyle(color: Colors.white),
                                ),
                              Obx(() =>  Text(
                                "${m.credit_list[0]['sum(credit)']}",
                                style: TextStyle(color: Colors.white),
                              )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Debit(-)",
                                  style: TextStyle(color: Colors.white),
                                ),
                               Obx(() => Text(
                                 "${m.debit_list[0]['sum(debit)']}",
                                 style: TextStyle(color: Colors.white),
                               )),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: 10, right: 2, left: 2, bottom: 10),
                              color: Colors.white,
                              height: height * .002,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Balance",
                                  style: TextStyle(color: Colors.white),
                                ),
                              Obx(() =>  Text(
                                "${m.balance_list[0]['sum(balance)']}",
                                style: TextStyle(color: Colors.white),
                              ),),
                              ],
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 80,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Home",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.backup),
                  title: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 80,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Backup",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 80,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Settings",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 80,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.all(20),
        height: 60,
        width: 60,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
        child: IconButton(
            color: Colors.white,
            iconSize: 35,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Add new account",
                        selectionColor: Colors.deepPurple),
                    content: TextField(
                      controller: t1,
                      decoration: InputDecoration(hintText: "Account Name"),
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("CANCEL")),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple),
                              onPressed: () {
                                String s1 = t1.text;
                                m.get_Database();
                                m.get_insert(s1);
                                // m.get_select();

                                Navigator.pop(context);
                                t1.text = "";
                              },
                              child: Text("SAVE")),
                        ],
                      )
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.library_add)),
      ),
      body: Obx(() => ListView.builder(
            itemCount: m.list.length,
            itemBuilder: (context, index) {
            // m.select_data(index);
              return InkWell(
                onTap: () {
                  m.select_data(m.list[index]['id']);
                  print("id: ${m.list[index]['id']}");
                  print("ind: $index");

                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Data_entry(m.list.value[index]['name'],
                          m.list.value[index]['id']);

                    },
                  ));
                },
                child: Card(
                  color: Colors.white70,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 160,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Container(
                                width: 150,
                                child: Text(
                                  "${m.list.value[index]['name']}",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 180,
                              ),
                              Wrap(
                                alignment: WrapAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.mode_edit_outline_outlined,
                                        color: Colors.deepPurple,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        m.get_delete(m.list.value[index]['id']);
                                      },
                                      icon: Icon(
                                        Icons.delete_outline_rounded,
                                        color: Colors.deepPurple,
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 8,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    height: 140,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Card(
                                            child: Container(
                                              // alignment: Alignment.centerLeft,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Credit(+)",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  Text(
                                                   "${m.list[index]['credit']}",
                                                   style:
                                                   TextStyle(fontSize: 20),
                                                 ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Card(
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Debit(-)",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                  Text(
                                                  "${m.list[index]['debit']}",
                                                  style:
                                                  TextStyle(fontSize: 20),
                                                ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Card(
                                            child: Container(
                                              color: Colors.deepPurple,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Balance",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    "${m.list[index]['balance']}",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
