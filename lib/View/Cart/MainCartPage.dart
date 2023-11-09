import 'package:flutter/material.dart';
import 'package:piztaurantflutter/View/ViewElements/PizTDialog.dart';
import 'package:piztaurantflutter/ViewModel/MainCartViewModel.dart';



class MainCartPage extends StatefulWidget {
  const MainCartPage({super.key, required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  State<MainCartPage> createState() => _MainCartPageState();
}

class _MainCartPageState extends State<MainCartPage> {
  final MainCartViewModel _mainCartViewModel = MainCartViewModel();


  @override
  void initState() {
    _mainCartViewModel.getCart();
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: widget.colorScheme.background,
      body: SafeArea(
        child: StreamBuilder(
          stream: _mainCartViewModel.streamController.stream,
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    snapshot.data![index].pizzaModel?.pizzaName ?? "piza yok",
                    style: TextStyle(
                        color: Colors.black
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _mainCartViewModel.close();
    super.dispose();
  }
}
