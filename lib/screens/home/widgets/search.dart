import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.seatNumberController,
    required this.onPressed,
  }) : super(key: key);

  final TextEditingController seatNumberController;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    double availableWidth = deviceSize(context).width - 50;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
          width: availableWidth * .85,
          child: TextFormField(
            controller: seatNumberController,
            keyboardType: TextInputType.number,
            expands: true,
            maxLines: null,
            onEditingComplete: () {
              closeKeyboard(context);
              onPressed();
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(left: 8, right: 8),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  bottomLeft: Radius.circular(4.0),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4.0),
                    bottomRight: Radius.circular(4.0),
                  ),
                ),
              ),
            ),
            onPressed: () {
              closeKeyboard(context);
              onPressed();
            },
            child: const Text(
              'Find',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  void closeKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
