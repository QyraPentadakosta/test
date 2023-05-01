import 'package:bloc/bloc.dart';

import '../../../core/routes/routes.dart';
import '../services/add_remove_services.dart';
import 'event.dart';
import 'state.dart';

class AddListBloc extends Bloc<AddListEvent, AddListState> {
  AddListBloc() : super(InitialAddListState());

  @override
  Stream<AddListState> mapEventToState(AddListEvent event) async* {
    if (event is AddListDataEvent) {
      await AddRemoveServices().addRemoveInterest(
        idUser: event.idUser,
        interest: event.data,
      );
      goBack(event.context);
      yield SuccessAddListState();
    }
  }
}
