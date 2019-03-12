import 'package:flutter/material.dart';

class ItemsMenuV2 extends StatefulWidget {
  @override
  _ItemsMenuV2State createState() => _ItemsMenuV2State();
}

class _ItemsMenuV2State extends State<ItemsMenuV2> {

  var displayCounter = false;
  var amount = 0;
  var displayNote = false;

  Widget itemsImage(){
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image(
          fit: BoxFit.cover,
          filterQuality: FilterQuality.low,
          image: AssetImage('lib/app/assets/dummyImage.png'),
          width: 80,
          height: 90,
        ),
      ),
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)
      ),
    );
  }

  Widget itemsG0(){
    // return Padding(
    //       padding: EdgeInsets.all(8),
    //       child: Row(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: <Widget>[
    //           itemsImage(),
    //           SizedBox(width: 10),
    //           itemContent()
    //         ],
    //       ),
    //     );
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              itemsImage(),
              SizedBox(width: 10),
              itemContent()
            ],
          ),
        ),
      );
  }

  Widget addItemsToChart(){
    return Container(
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          displayCounter ? 
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Card(
                    elevation: 2,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: SizedBox(
                      width: 30,
                      height: 30,
                      child: IconButton(
                        alignment: Alignment.center,
                        color: Colors.blue,
                        iconSize: 15,
                        icon: Icon( Icons.edit ),
                        splashColor: Colors.white70,
                        onPressed: () {
                          setState(() {
                            displayNote = !displayNote; 
                          });
                        },
                      ),
                    )
                  ),
                  SizedBox(width: 16),
                  SizedBox(
                    height: 38,
                    child: Card(
                      elevation: 2,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            alignment: Alignment.centerLeft,
                            color: Colors.blue,
                            iconSize: 15,
                            icon: Icon( Icons.remove),
                            splashColor: Colors.white70,
                            onPressed: () {
                              setState(() {
                                displayCounter = false; 
                              });
                            },
                          ),
                          Text(
                            '$amount',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          IconButton(
                            alignment: Alignment.centerRight,
                            color: Colors.blue,
                            iconSize: 15,
                            icon: Icon( Icons.add ),
                            splashColor: Colors.white70,
                            onPressed: () {
                              setState(() => amount+=1);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
          : 
          RaisedButton(
            child: Text(
              'Tambah',
              style: TextStyle( color: Colors.white ),
            ),
            color: Colors.blueAccent,
            onPressed: (){
              setState(() {
                displayCounter = true; 
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            ),
          ),
        ],
      ),
    );
  }

  Widget itemContent(){
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Jus Jagung',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Text(
                '18,760',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 8),
              Text(
                '26.800',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  decoration: TextDecoration.lineThrough
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          addItemsToChart(),
          displayNote ? 
            (
              Column(
                children: <Widget>[
                  TextFormField(
                    maxLines: 9,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Contoh : Extra Pedas Ya !!',
                      border: InputBorder.none
                    ),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: SizedBox(
                      height: 1,
                      child: Container(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: RaisedButton(
                      textTheme: ButtonTextTheme.normal,
                      child: Text(
                        'Selesai',
                        style: TextStyle( color: Colors.white ),
                      ),
                      color: Colors.blueAccent,
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      ),
                    ),
                  ),
                ],
              )
            )
            :
            (
              Container()
            )
        ],
      ),
    );
  }

  void displayBottom(){
    showModalBottomSheet(
      context: context,
      builder: (builder){
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                alignment: Alignment.bottomCenter,
                height: 30,
                color: Colors.blue,
                child: Icon(
                  Icons.drag_handle,
                  color: Colors.white,
                  size: 40.0,
                ),
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Tambah Catatan Untuk Pesanan',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        height: 1,
                        child: Container(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    TextFormField(
                      maxLines: 9,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Contoh : Extra Pedas Ya !!',
                        border: InputBorder.none
                      ),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: SizedBox(
                        height: 1,
                        child: Container(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: RaisedButton(
                        textTheme: ButtonTextTheme.normal,
                        child: Text(
                          'Selesai',
                          style: TextStyle( color: Colors.white ),
                        ),
                        color: Colors.blueAccent,
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return itemsG0();
  }
}