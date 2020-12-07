import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:servertest/app/modules/stock/stock_controller.dart';

class GetMainCategoriesWidget2 extends StatefulWidget {

  final String path;
  final Function action;

  const GetMainCategoriesWidget2({Key key, this.path, this.action}) : super(key: key);

  @override
  _GetMainCategoriesWidgetState createState() => _GetMainCategoriesWidgetState();
}

class _GetMainCategoriesWidgetState extends State<GetMainCategoriesWidget2> {

  final _controller = Modular.get<StockController>();

  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        GestureDetector(
          onTap: () {
            setState(() {
              _active = !_active;
            });
          },
          child: Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [

                    Container(width: 80,
                      child: Center(
                        child: Text(
                          'GET',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[400],
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(
                        left: 5,
                        right: 20,
                      ),
                      height: 30,
                      width: 2,
                      color: Colors.grey[400],
                    ),

                    Text(
                      widget.path,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                  ],
                )
              ),
            ),
          ),
        ),

        _active ? Align(
          alignment: Alignment.centerRight,
          child: FlatButton(
            onPressed: widget.action,
            color: Colors.red[700],
            child: Text(
              'Get',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ) : Container(),

        _active ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              'Response',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.grey),
              ),
              padding: EdgeInsets.all(8),
              width: double.infinity,
              height: 100,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: StreamBuilder(
                    stream: _controller.pedidosOut,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Erro');
                      }
                      if (snapshot.hasData) {
                        return Text(snapshot.data);
                      }
                      return Text('Final');
                    }
                ),
              ),
            ),

//            Observer(builder: (_) {
//              return Container(
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.all(Radius.circular(10)),
//                  border: Border.all(color: Colors.grey),
//                ),
//                padding: EdgeInsets.all(8),
//                width: double.infinity,
//                height: 100,
//                child: SingleChildScrollView(
//                  scrollDirection: Axis.vertical,
//                  child: Text(
//                    _controller.mainCategories == null ? '' : _controller.mainCategories,
//                    style: TextStyle(
//                      fontSize: 18,
//                    ),
//                  ),
//                ),
//              );
//            })

          ],
        ) : Container(),

      ],
    );
  }
}
