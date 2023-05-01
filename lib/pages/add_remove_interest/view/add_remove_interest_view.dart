import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../widget/appbar/leading_primary.dart';
import '../../../widget/bg/background.dart';
import '../bloc/bloc.dart';
import '../view_model/add_remove_interest_view_model.dart';

class AddRemoveInterestView extends StatelessWidget {
  static const routeName = '/add-remove-interest-view';

  const AddRemoveInterestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments as Map;
    List<String> data = [];
    if (arguments['data'] != null) {
      data = arguments['data'] as List<String>;
    }
    return BlocProvider(
      create: (BuildContext context) => AddListBloc(),
      child: Builder(
        builder: (context) => ChangeNotifierProvider(
          create: (BuildContext context) =>
              AddRemoveInterestViewModel()..setDataFormArguments(context, data),
          child: Scaffold(
            backgroundColor: const Color(0xFF09141A),
            extendBodyBehindAppBar: true,
            appBar: _appBar(context),
            body: Stack(
              children: [
                Background.backGroundImage(context),
                _body(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      height: context.mQHeight(1),
      padding: EdgeInsets.symmetric(horizontal: context.padding2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _text(context),
          context.sbHeight(size: context.padding4),
          _textField(context),
        ],
      ),
    );
  }

  Widget _textField(BuildContext context) {
    return Consumer<AddRemoveInterestViewModel>(
      builder: (context, provider, child) {
        return Container(
          width: context.mQWidth(1),
          constraints: const BoxConstraints(
            minHeight: 50,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(9),
          ),
          child: Wrap(
            children: [
              Container(
                constraints: BoxConstraints(
                  minHeight: context.mQHeight(0.06),
                ),
                decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(9),
                ),
                padding: EdgeInsets.only(
                  right: context.padding2,
                  top: context.padding2,
                  left: context.padding2,
                  bottom: context.padding1,
                ),
                child: Wrap(
                  children: [
                    ..._listResult(
                      context,
                      provider.listStringData,
                    ),
                    _textFieldData(context)
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _textFieldData(BuildContext context) {
    return Consumer<AddRemoveInterestViewModel>(
      builder: (context, provider, child) {
        return Container(
          height: 30,
          constraints: BoxConstraints(
            maxWidth: context.mQWidth(0.5),
          ),
          child: TextField(
            autofocus: true,
            focusNode: provider.focusNode,
            textCapitalization: TextCapitalization.words,
            controller: provider.textEditingController,
            textInputAction: TextInputAction.done,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            onSubmitted: (value) {
              provider.addData(value);
              provider.clearDataTextField();
            },
            // textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              hintText: "",
              filled: true,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(9),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(9),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(9),
              ),
              fillColor: Colors.transparent,
              // Colors.white.withOpacity(0.05),
              hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.5),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 5,
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _listResult(BuildContext context, List<String> valueList) {
    List<Widget> data = valueList.map((e) {
      int index = valueList.indexOf(e);
      return _styleResult(context, index, e);
    }).toList();
    return data;
  }

  Widget _styleResult(BuildContext context, int index, String value) {
    return Container(
      margin: EdgeInsets.only(
        right: context.padding1,
        bottom: context.padding1,
      ),
      height: 30,
      width: context.mQWidth(value.length <= 5 ? 0.2 : (value.length * 0.03)),
      padding: EdgeInsets.symmetric(
        horizontal: context.padding1,
        vertical: context.padding1,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          InkWell(
            onTap: () {
              context.read<AddRemoveInterestViewModel>().removeData(value);
            },
            child: Image.asset(
              'assets/close.png',
              width: 12,
              height: 12,
            ),
          )
        ],
      ),
    );
  }

  Widget _text(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.padding2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tell everyone about yourself",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: [
                    Color(0xffF3EDA6),
                    Color(0xffF8FAE5),
                    Color(0xffFFE2BE),
                    Color(0xffD5BE88),
                    Color(0xffF8FAE5),
                    Color(0xffD5BE88),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ).createShader(
                  const Rect.fromLTWH(
                    0.0,
                    0.0,
                    200.0,
                    100.0,
                  ),
                ),
            ),
          ),
          context.sbHeight(size: context.padding2),
          const Text(
            "What interest you?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    var bloc = context.read<AddListBloc>();
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      leading: const LeadingPrimary(),
      leadingWidth: context.mQWidth(0.2),
      actions: [
        Consumer<AddRemoveInterestViewModel>(
          builder: (context, provider, child) {
            return TextButton(
              onPressed: () {
                provider.saveData(context, bloc);
              },
              child: Text(
                "Save",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: [
                        Color.fromRGBO(171, 255, 253, 0),
                        Color.fromRGBO(69, 153, 219, 1),
                        Color.fromRGBO(170, 218, 255, 1),
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ).createShader(
                      const Rect.fromLTWH(
                        0.0,
                        0.0,
                        200.0,
                        100.0,
                      ),
                    ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
