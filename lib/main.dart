import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyWidgetList(),
    );
  }
}

class MyWidgetList extends StatefulWidget {
  @override
  _MyWidgetListState createState() => _MyWidgetListState();
}

class _MyWidgetListState extends State<MyWidgetList> {

  List widgets = [
    Future.delayed(Duration(seconds: 2), () {return Container(
      height: 100,
      margin: EdgeInsetsDirectional.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.blueAccent
      ),
      child: Center(
        child: Text('Categories',style: TextStyle(
          fontSize: 25,

        )),
      ),
    );}),
    Future.delayed(Duration(seconds: 4), (){return Container(
      height: 100,
      margin: EdgeInsetsDirectional.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.blueAccent
      ),
      child: Center(
        child: Text('Photos',style: TextStyle(
          fontSize: 25,

        )),
      ),
    );}),
    Future.delayed(Duration(seconds: 6), () { return  Container(
        height: 100,
        margin: EdgeInsetsDirectional.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.blueAccent
        ),
        child: Center(
          child: Text('Vidoes',style: TextStyle(
            fontSize: 25,

          )),
        ));}),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('Pagelets Example ',style: TextStyle(
              fontSize: 40,
              color: Colors.red,
              fontWeight: FontWeight.bold),),
          backgroundColor: Colors.white,


        ),
        body: ListView.separated(
            itemCount: widgets.length,

            itemBuilder: (context, index) {
              return FutureBuilder(
                future: widgets[index],
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return snapshot.data as Widget;
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              );
            }, separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 50,);
        },
            ),
        );
    }
}