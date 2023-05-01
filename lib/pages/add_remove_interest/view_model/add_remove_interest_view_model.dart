import 'package:flutter/material.dart';

import '../../../application/constant/constant.dart';
import '../../../core/constant/constant.dart';
import '../bloc/bloc.dart';
import '../bloc/event.dart';

class AddRemoveInterestViewModel extends ChangeNotifier {
  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();

  List<String> listStringData = [];

  void addData(String data) {
    if (data.isEmpty) {
      return;
    }
    listStringData.add(data);
    notifyListeners();
  }

  void removeData(String data) {
    listStringData.remove(data);
    notifyListeners();
  }

  void clearDataTextField() {
    textEditingController.clear();
    notifyListeners();
  }

  void setDataFormArguments(BuildContext context, List<String> data) {
    listStringData = data;
    notifyListeners();
  }

  Future saveData(BuildContext context, AddListBloc bloc) async {
    String? id = await IStorage.getString(IConstant.idUser) ?? "0";
    bloc.add(AddListDataEvent(context,
        idUser: int.tryParse(id) ?? 0, data: listStringData));
  }
}
