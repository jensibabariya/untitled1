import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled1/mycontroller.dart';

class Data_entry extends StatefulWidget {
  String? Name;
  int? id;

  Data_entry([this.Name, this.id]);

  @override
  State<Data_entry> createState() => _Data_entryState();
}

class _Data_entryState extends State<Data_entry> {
  TextEditingController datecontroller = TextEditingController();
  MyController m = Get.put(MyController());

  //DateTime? PickedDate=DateTime.now();
  String type = "";
  TextEditingController amount = TextEditingController();
  TextEditingController perticuler = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  m.age_select(context);
    m.get_Database();

    datecontroller.text = m.convertedDate.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("${widget.Name}"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Container(
                            margin: EdgeInsets.zero,
                            alignment: Alignment.center,
                            height: 28,
                            width: double.infinity,
                            color: Colors.deepPurple,
                            child: Text(
                              "Add transaction",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            )),
                        actions: [
                          Column(
                            children: [
                              Text(
                                "Transation Date",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                child: TextField(
                                    controller: datecontroller,
                                    //editing controller of this TextField
                                    decoration: const InputDecoration(
                                        icon: Icon(Icons.calendar_today),
                                        //icon of text field
                                        labelText:
                                            "Enter Date" //label text of field
                                        ),
                                    readOnly: true,
                                    // when true user cannot edit text
                                    onTap: () {
                                      m.age_select(context);

                                      if (m.selectDate == null) {
                                        datecontroller.text =
                                            m.convertedDate.toString();
                                      } else {
                                        datecontroller.text =
                                            m.selectDate.toString();
                                      }
                                      print("date: ${datecontroller.text}");
                                    }),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Transation Type",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Obx(
                                    () => Radio(
                                      value: "credit",
                                      groupValue: m.sel_type.value,
                                      onChanged: (value) {
                                        m.select_type(value);
                                      },
                                    ),
                                  ),
                                  Text("Credit(+)"),
                                  Obx(
                                    () => Radio(
                                      value: "debit",
                                      groupValue: m.sel_type.value,
                                      onChanged: (value) {
                                        m.select_type(value);

                                        // m.total_credit(value);
                                      },
                                    ),
                                  ),
                                  Text("Debit(-)"),
                                ],
                              ),
                              Card(
                                  child: TextField(
                                textAlign: TextAlign.center,
                                controller: amount,
                                decoration: InputDecoration(
                                  hintText: "Amount",
                                ),
                              )),
                              Card(
                                  child: TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: "Perticuler",
                                ),
                                controller: perticuler,
                              )),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 80,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.deepPurple),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text("Cancel",
                                        style: TextStyle(
                                            color: Colors.deepPurple,
                                            fontSize: 15)),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      String date = datecontroller.text;
                                      String type = m.sel_type.value;
                                      String amt = amount.text;
                                      String per = perticuler.text;

                                      m.get_Database();

                                      m.data_insert(widget.id as int, date,
                                          type, amt, per);

                                      m.select_data(widget.id as int);

                                      //  m.total_credit(widget.id as int);
                                      // m.total_debit(widget.id as int);

                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      //
                                      width: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.deepPurple,
                                      ),
                                      child: Text(
                                        "Save",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(Icons.library_add_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.grey[200],
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Date",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text("Perticuler",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text("Credit",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text("Debit",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 15,
                child: Obx(() => ListView.builder(
                      itemCount: m.list_data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Wrap(alignment: WrapAlignment.spaceBetween,
                                    children: [
                                      Container(child: Text("EDIT")),

                                      InkWell(onTap: () {

                                      },child: Text("DELETE"))
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 35,
                            margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                            color: (m.list_data.value[index]['type'] == "debit")
                                ? Colors.white
                                : Colors.grey[200],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${m.list_data.value[index]['date']}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: (m.list_data.value[index]
                                                    ['type'] ==
                                                "debit")
                                            ? Colors.red
                                            : Colors.green)),
                                Text(
                                    "${m.list_data.value[index]['perticuler']}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: (m.list_data.value[index]
                                                    ['type'] ==
                                                "debit")
                                            ? Colors.red
                                            : Colors.green)),
                                (m.list_data.value[index]['type'] == "credit")
                                    ? Text(
                                        "${m.list_data.value[index]['credit']}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: (m.list_data.value[index]
                                                        ['type'] ==
                                                    "debit")
                                                ? Colors.red
                                                : Colors.green))
                                    : Text("0",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: (m.list_data.value[index]
                                                        ['type'] ==
                                                    "debit")
                                                ? Colors.red
                                                : Colors.green)),
                                (m.list_data.value[index]['type'] == "debit")
                                    ? Text(
                                        "${m.list_data.value[index]['debit']}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: (m.list_data.value[index]
                                                        ['type'] ==
                                                    "debit")
                                                ? Colors.red
                                                : Colors.green))
                                    : Text("0",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: (m.list_data.value[index]
                                                        ['type'] ==
                                                    "debit")
                                                ? Colors.red
                                                : Colors.green)),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
              ),
              Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Card(
                          color: Colors.white70,
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Container(
                            margin: EdgeInsets.all(10),
                            height: 140,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Card(
                                    child: Container(
                                      // alignment: Alignment.centerLeft,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Credit(+)",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Obx(
                                            () => Text(
                                              "${m.result.value[0]['sum(credit)']}",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          )
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
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Debit(-)",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Obx(
                                            () => Text(
                                              "${m.result1.value[0]['sum(debit)']}",
                                              style: TextStyle(fontSize: 15),
                                            ),
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
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Balance",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Obx(
                                            () => Text(
                                              "${m.bal.value[0]['Difference']}",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        )
        // body: Column(
        //   children: [

        //
        //   ],
        // ),
        );
  }
}
