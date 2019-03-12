import 'package:flutter/material.dart';

class ItemsMenu extends StatefulWidget {

  final Map<String, String> dataState;
  final ValueChanged<void> incrementItems;
  final ValueChanged<void> decrementItems;
  final ValueChanged<void> addChart;
  final ValueChanged<void> removeChart;

  const ItemsMenu({ Key key, this.decrementItems, this.incrementItems, this.dataState, this.addChart, this.removeChart }) : super(key :key);

  @override
  ItemsMenuState createState() => ItemsMenuState();
}

class ItemsMenuState extends State<ItemsMenu> {
  int counter = 0;

  void incrementItems(){
    setState(() {
     counter++; 
    });
  }

  void decrementItems(){
    setState(() {
     counter--; 
    });
  }

  final separator = Container(
    width: double.infinity,
    color: Colors.grey,
    height: 1,
  );
  Widget imageItems(String path){
    return Image(
      image: AssetImage(path),
      height: 100,
    );
  }
  final addItemsToCart = RaisedButton(
    child: Text(
      'Tambah',
      style: TextStyle( color: Colors.white ),
    ),
    color: Colors.blueAccent,
    onPressed: (){

    },
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8)
    ),
  );
  Widget items(Map<String, String> data){
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            data['menu'],
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height : 4),
          Text(
            data['description'],
            maxLines: 2,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
          SizedBox(height : 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                data['price'] != null ? data['price'] : '10.000',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  counter > 0 ? SizedBox(
                    height: 35.0,
                      child: Text(
                      '$counter',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ) :Container(),
                  SizedBox(
                    width: 8,
                  ),
                  counter > 0 ? SizedBox(
                    width: 40,
                    child: Material(
                      borderRadius: BorderRadius.circular(4),
                      child: MaterialButton(
                        height: 28.0,
                        onPressed: (){
                          widget.decrementItems(null);
                          decrementItems();
                          if (counter == 0) {
                            widget.removeChart(null);
                          }
                        },
                      color: Colors.blueGrey,
                      child: Text('-', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ) : Container(),
                  SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    child: addItemsToCart,
                    // child: Material(
                    //   borderRadius: BorderRadius.circular(4),
                    //   child: MaterialButton(
                    //     height: 28.0,
                    //     onPressed: (){
                    //       widget.incrementItems(null);
                    //       incrementItems();
                    //       if (counter == 1) {
                    //         widget.addChart(null);
                    //       }
                    //     },
                    //   color: Colors.blueAccent,
                    //   child: Text('+', style: TextStyle(color: Colors.white)),
                    //   ),
                    // ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget rowItems(){
    var data = widget.dataState;
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                imageItems(data['image']),
                SizedBox(width : 8),
                items(data)
              ],
            ),
          ),
          SizedBox(height: 4),
          separator,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return rowItems();
  }
}
