import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  int count;

  ProductList({this.count}):
        assert(count != null);

  @override
  ProductListState createState() => new ProductListState();
}

class ProductListState extends State<ProductList>{
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController(initialScrollOffset: 100.0,keepScrollOffset: true);

  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        itemCount: widget.count,
        itemBuilder: (context,index){
          return Text('Row $index');
        });
  }



}

