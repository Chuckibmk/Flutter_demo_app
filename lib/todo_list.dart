import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Map<String, dynamic>> coins = [
    {"name": "", "value": ""},
  ];

  TextEditingController coinName = TextEditingController();
  TextEditingController coinValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo List Assignment")),
      body: Container(
          child: Container(
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
                  Container(
                    height: 300,
                    // padding:EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                    child: ListView.builder(
                        itemCount: coins.length,
                        itemBuilder: (context, i) {
                          return Coin(coins[i]);
                        }),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Form(
                        child: Column(
                      children: [
                        TextFormField(
                          controller: coinName,
                          decoration: InputDecoration(
                              labelText: "Coin Name",
                              prefixIcon: Icon(Icons.money),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                        SizedBox(height: 5),
                        TextFormField(
                          controller: coinValue,
                          decoration: InputDecoration(
                              labelText: "Coin Value",
                              prefixIcon: Icon(Icons.airline_seat_flat),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          child: MaterialButton(
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                              shape: StadiumBorder(),
                              child: Text("Submit"),
                              onPressed: () {
                                setState(() {
                                  coins.add({
                                    "name": coinName.text,
                                    "value": coinValue.text,
                                  });
                                });
                                coinName.clear();
                                coinValue.clear();
                              }),
                        )
                      ],
                    )),
                  ),
                ],
              ))),
    );
  }

  Widget Coin(coin) {
    return Container(
      child: Card(
        elevation: 5,
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 5),
        child: ListTile(
            leading: CircleAvatar(child: Icon(Icons.account_balance)),
            title: Text(coin["name"],
                style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(coin["value"]),
            trailing: InkWell(
              onTap: () {
                showAlert2Actions(context, coin);
              },
              child: Icon(Icons.cancel, color: Colors.red),
            )),
      ),
    );
  }

  showAlert2Actions(BuildContext context, coin) {
    Widget okButton = MaterialButton(
      color: Colors.greenAccent,
      textColor: Colors.white,
      onPressed: () {
        setState(() {
          coins.remove(coin);
          Navigator.pop(context);
        });
      },
      child: Text("Yes"),
    );

    Widget continueBTN = MaterialButton(
      color: Colors.redAccent,
      textColor: Colors.white,
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text("No"),
    );

    var alertDialg = AlertDialog(
      titlePadding: EdgeInsets.zero,
      actions: [okButton, continueBTN],
      title: Container(
        child: Column(children: [
          Container(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(
                Icons.cancel,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Text("Delete From List"),
        ]),
      ),
      // content: Text("No Reverse after this action"),
      backgroundColor: Colors.white,
    );
    showDialog(
        context: context,
        builder: (ctx) {
          return alertDialg;
        });
  }
}
