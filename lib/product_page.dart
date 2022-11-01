import 'package:demo_bloc/product_bloc.dart';
import 'package:demo_bloc/product_event.dart';
import 'package:demo_bloc/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Bloc"),
      ),
      body: Container(
        child: BlocProvider(
          create: (_) => ProductBloc(),
          child: CalculatorWidget(),
        ),
      ),
    );
  }
}

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({Key? key}) : super(key: key);

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  late ProductBloc productBloc;

  @override
  void initState() {
    super.initState();
    productBloc = context.read<ProductBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductStateBase>(
      listener: (context, state) {
        print(state.runtimeType);
      },
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: (){
                    productBloc.add(IncreaseEvent());
                  },
                  child: Text("+")
              ),
              Text(state.value.toString()),
              ElevatedButton(
                  onPressed: (){
                    productBloc.add(DecreaseEvent());
                  },
                  child: Text("-")
              ),
            ],
          ),
        );
      },
    );
  }
}