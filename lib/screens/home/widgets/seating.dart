import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class Cell extends StatelessWidget {
  const Cell({
    Key? key,
    required this.seatNumber,
    required this.highlight,
  }) : super(key: key);
  final int seatNumber;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    final String seatType = getSeatType(seatNumber);
    return Container(
      height: 50,
      width: 50,
      color:
          highlight ? (Colors.blue) : const Color.fromARGB(255, 187, 211, 253),
      child: Center(
        child: Text(
          '$seatNumber\n$seatType',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class CompartmentUpper extends StatelessWidget {
  const CompartmentUpper({
    Key? key,
    required this.seats,
    required this.highlight,
  }) : super(key: key);
  final List<int> seats;
  final int highlight;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      customPath: (_) => customPathUpper,
      color: Colors.indigo,
      dashPattern: const [25, 0, 0, 150, 150, 0],
      strokeWidth: 5,
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        width: 150,
        height: 50,
        color: Colors.green.withAlpha(20),
        child: SizedBox(
          width: 150,
          child: Row(
            children: seats
                .map((e) => Cell(
                      seatNumber: e,
                      highlight: highlight == e,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}

class CompartmentLower extends StatelessWidget {
  const CompartmentLower({
    Key? key,
    required this.seats,
    required this.highlight,
  }) : super(key: key);
  final List<int> seats;
  final int highlight;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      customPath: (_) => customPathLower,
      color: Colors.indigo,
      dashPattern: const [25, 0, 0, 150, 150, 0],
      strokeWidth: 5,
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        width: 150,
        height: 50,
        color: Colors.green.withAlpha(20),
        child: SizedBox(
          width: 150,
          child: Row(
              children: seats
                  .map(
                    (e) => Cell(
                      seatNumber: e,
                      highlight: highlight == e,
                    ),
                  )
                  .toList()),
        ),
      ),
    );
  }
}

class CompartmentSideUpper extends StatelessWidget {
  const CompartmentSideUpper({
    Key? key,
    required this.seatNumber,
    required this.highlight,
  }) : super(key: key);
  final int seatNumber, highlight;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      customPath: (_) => customPathSideUpper,
      color: Colors.indigo,
      dashPattern: const [25, 0, 0, 150, 150, 0],
      strokeWidth: 5,
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        width: 50,
        height: 50,
        color: Colors.green.withAlpha(20),
        child: Cell(seatNumber: seatNumber, highlight: highlight == seatNumber),
      ),
    );
  }
}

class CompartmentSideLower extends StatelessWidget {
  const CompartmentSideLower({
    Key? key,
    required this.seatNumber,
    required this.highlight,
  }) : super(key: key);
  final int seatNumber, highlight;

  @override
  Widget build(BuildContext context) {
    Path customPathSideLower = Path()
      ..moveTo(0, 25)
      ..lineTo(0, 50)
      ..moveTo(25, 54)
      ..lineTo(0, 54)
      ..moveTo(25, 54)
      ..lineTo(54, 54)
      ..lineTo(54, 25)
      ..moveTo(0, 25)
      ..lineTo(0, 56.5);
    return DottedBorder(
      customPath: (_) => customPathSideLower,
      color: Colors.indigo,
      dashPattern: const [25, 0, 0, 150, 150, 0],
      strokeWidth: 5,
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        width: 50,
        height: 50,
        color: Colors.green.withAlpha(20),
        child: Cell(seatNumber: seatNumber, highlight: highlight == seatNumber),
      ),
    );
  }
}

class Compartment extends StatelessWidget {
  const Compartment({
    Key? key,
    required this.seatMultiple,
    required this.highlight,
  }) : super(key: key);
  final int seatMultiple, highlight;

  @override
  Widget build(BuildContext context) {
    int temp = 8 * (seatMultiple - 1);
    List<int> up = [temp + 1, temp + 2, temp + 3];
    List<int> down = [temp + 4, temp + 5, temp + 6];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CompartmentUpper(seats: up, highlight: highlight),
            CompartmentSideUpper(
              seatNumber: 8 * seatMultiple - 1,
              highlight: highlight,
            )
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CompartmentLower(seats: down, highlight: highlight),
            CompartmentSideLower(
              seatNumber: 8 * seatMultiple,
              highlight: highlight,
            )
          ],
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
