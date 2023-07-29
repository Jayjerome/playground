import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DraggableIconContainer(),
    );
  }
}

class DraggableIconContainer extends StatefulWidget {
  @override
  _DraggableIconContainerState createState() => _DraggableIconContainerState();
}

class _DraggableIconContainerState extends State<DraggableIconContainer> {
  double _dragValue = 0;
  double _maxDragValue = 200; // Adjust this value as needed

  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragValue += details.delta.dx;
    });
  }

  void _onDragEnd(DragEndDetails details) {
    setState(() {
      if (_dragValue.abs() > _maxDragValue) {
        print('end');
      } else {
        print('not end');
        _dragValue = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildCard()),
    );
  }

  Widget _buildCard() {
    return GestureDetector(
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 16,
        child: Padding(
          padding: const EdgeInsets.only(top: 32, left: 4, right: 4),
          child: Wrap(
            children: [
              Stack(children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.sd,
                                  size: 25,
                                ),
                                const SizedBox(height: 8),
                                Icon(
                                  Icons.sd,
                                  size: 25,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Center(
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'vs',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.sd,
                                  size: 25,
                                ),
                                const SizedBox(height: 8),
                                Icon(
                                  Icons.sd,
                                  size: 25,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedAlign(
                      duration: Duration(milliseconds: 200),
                      alignment: Alignment(_dragValue / _maxDragValue, 0),
                      child: Icon(Icons.add, size: 50,),
                    ),
                  ],
                ),

              ]),
            ],
          ),
        ),
      ),
    );
  }
}
