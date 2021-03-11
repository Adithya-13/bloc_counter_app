import 'package:bloc_counter_app/domain/cubit/counter_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdScreen extends StatefulWidget {
  ThirdScreen({Key key, this.title, this.color}) : super(key: key);

  final String title;
  final Color color;

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: widget.color,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              //Gabungan antara BlocProvider and BlocListener
              listener: (context, state) => Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: state.wasIncremented
                      ? Text("Increment!!")
                      : Text("Decrement!!"),
                ),
              ),
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  backgroundColor: widget.color,
                  heroTag: "secondDecrement",
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                    print("decrement");
                  },
                  tooltip: 'Decrement',
                  child: Icon(CupertinoIcons.minus),
                ),
                FloatingActionButton(
                  backgroundColor: widget.color,
                  heroTag: "secondIncrement",
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
