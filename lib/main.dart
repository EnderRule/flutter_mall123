import 'package:flutter/material.dart';
import 'package:flutter_123mall/MyEvent.dart';
import 'package:flutter_123mall/ProductList.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '123 拍賣 _FLT',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: '123 拍賣'),
      showPerformanceOverlay: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _counter = 8;
  ListView myListview;
  static List<Widget> widgets = [];
  List<MyEvent> events = [];
  TabController controller;

  ProductList list1;
  ProductList list2;
  
  @override
  void initState(){
    super.initState();
    for (int i = 0; i < _counter; i++) {
      widgets.add(getWidget(i));
      events.add( MyEvent(
          title: 'ffsjklfjkfsj This class is the configuration for the state. It holds the values (in thisThis class is the configuration for the state. It holds the values (in thisThis class is the configuration for the state. It holds the values (in this',
          id:3322,
          avatar:'https://res.infoq.com/articles/why-flutter-uses-dart/zh/resources/4921-1520961764002.png')
      );
    }
    myListview  = ListView(
        children:widgets,
        controller: new ScrollController(
            initialScrollOffset: 0.0,
            keepScrollOffset: true,
            debugLabel: 'scrolled debug label'
        )
    );
    controller = new TabController(length: 5, vsync: this);

    list1 = ProductList(count:150);
    list2 = ProductList(count:300);
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;

//      widgets.removeLast();
      widgets.add(getWidget(0));

      events.add( MyEvent(
          title: 'ffsjklfjkfsj This class is the configuration for the state. It holds the values (in thisThis class is the configuration for the state. It holds the values (in thisThis class is the configuration for the state. It holds the values (in this',
          id:3322,
          avatar:'https://res.infoq.com/articles/why-flutter-uses-dart/zh/resources/4921-1520961764002.png')
      );
//      myListview.controller.animateTo(550.0, duration: new Duration(seconds:1) , curve: Curves.easeInOut);
    });
  }

  List<Widget> getrows() {
    List<Widget> rows  = [];
    for (int i = 0; i < 5; i++) {
      rows.add(
          new Expanded(
            child: new Padding(
              padding: EdgeInsets.all(10.0),
              child: new Text('rrrr $i',
                  textAlign: TextAlign.center),)
          )
      );
    }
    return rows;
  }

  Widget getWidget(int row) {
    if (row == 0 ) {
      return Row(children: getrows());
    } else {
      MyEvent event = events[row - 1];
      TextStyle style = TextStyle(color: Colors.black54,fontSize: 14.0);
      return GestureDetector(
        child: new Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
            child: new Column(
            children: <Widget>[
              new Row(children:[
                new Image.network(event.avatar,width:44.0,height: 44.0),
                new Padding(padding: EdgeInsets.all(15.0),child:
                    new Column(children:[
                      new SizedBox(width: 320.0,child:
                        new Text(event.title),
                      ),
                      new SizedBox(width: 320.0,child:
                        new Text('more detail for 活跃时间'),
                      ),
                    ]),
                ), 
              ]),
              new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    new Text('Row event id = '+ event.id.toString() + "  " + event.title,
                      textScaleFactor: 1.3, style: style,
                    ),
                  ]),
              new Icon(Icons.star, color:Colors.red),
              new SizedBox(height: 10.0,),
              new Divider(height: 2.0,indent:0.0,color:Colors.black26,)
            ]),
        ),
        onTap: () {
          setState(() {
            events.add(events.last);
            widgets = new List.from(widgets);
            widgets.insert(row, getWidget(widgets.length + 1));
//            myListview.controller.animateTo(55.0, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
//         Here we take the value from the MyHomePage object that was created by
//         the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
        backgroundColor: Color(0xFFFFDA44),
      ),
      body: new TabBarView(
          controller: controller,
          children: [
            ListView.builder(
                itemCount: widgets.length,
                itemBuilder: (context,i){
                  if (i == 0 ) {
                    return Row(children: getrows());
                  } else {
                    return getWidget(i);
                  }
                }
            ),
            list1,
            list2,
            Text("waiting "),
            Text('coming soon ')
          ]
      ),
      bottomNavigationBar: new Material(
        color: Colors.white10,
        child: new TabBar(
            indicatorPadding: EdgeInsets.all(4.0),
            indicatorColor: Color(0xFFFF9000),
            indicatorWeight: 1.5,
            labelColor: Color(0xFFFFDA44),
            unselectedLabelColor: Colors.grey,
            controller: controller,
            tabs: [
              new Tab(text: "出售",icon: Icon(Icons.local_grocery_store),),
              new Tab(text: "分類",icon: Icon(Icons.category),),
              new Tab(text: "發佈",icon: Icon(Icons.add),),
              new Tab(text: "訊息",icon: Icon(Icons.message),),
              new Tab(text: "我的",icon: Icon(Icons.home),),
            ]),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
