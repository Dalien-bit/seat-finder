import 'package:flutter/material.dart';
import '../universal widgets/layout_widgets.dart';
import 'widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int highlight = 0;
  final TextEditingController _seatNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // double height = deviceSize(context).height - appBarHeight;
    // double width = deviceSize(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar('Seat Finder'),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView.builder(
          itemCount: 8 + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: SearchBar(
                  onPressed: findSeat,
                  seatNumberController: _seatNumberController,
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Compartment(seatMultiple: index, highlight: highlight),
              );
            }
          },
        ),
      ),
    );
  }

  void findSeat() {
    setState(() {
      highlight = int.tryParse(_seatNumberController.text) ?? 0;
    });
  }
}
