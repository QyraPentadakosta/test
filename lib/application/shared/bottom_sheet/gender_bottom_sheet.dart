import 'package:flutter/cupertino.dart';

class GenderBottomSheet {
  Future<String?> showGenderBottomSheet(BuildContext context) async {
    const List<String> _gender = <String>[
      'Male',
      'Female',
    ];
    String? gender;

    await showCupertinoModalPopup(
      context: context,
      builder: (context) {
        String selectedGender = _gender[0];
        return Container(
          height: 300,
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                Expanded(
                  child: CupertinoPicker(
                    magnification: 1.1,
                    useMagnifier: true,
                    onSelectedItemChanged: (int value) {
                      selectedGender = _gender[value];
                    },
                    itemExtent: 32,
                    children: List<Widget>.generate(
                      _gender.length,
                      (int index) {
                        return Center(
                          child: Text(_gender[index]),
                        );
                      },
                    ),
                  ),
                ),
                CupertinoButton(
                  child: const Text('OK'),
                  onPressed: () {
                    gender = selectedGender;
                    Navigator.pop(context, gender);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );

    if (gender != null) {
      return gender;
    }
    return null;
  }
}
