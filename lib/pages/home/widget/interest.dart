import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../core/routes/routes.dart';
import '../../add_remove_interest/view/add_remove_interest_view.dart';
import '../bloc/bloc.dart';
import '../bloc/event.dart';
import '../bloc/state.dart';

class Interest extends StatelessWidget {
  const Interest({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<HomeBloc>(context);
    return Container(
      width: context.mQWidth(1),
      constraints: const BoxConstraints(
        minHeight: 120,
      ),
      padding: EdgeInsets.all(context.padding2),
      decoration: BoxDecoration(
        color: const Color(0xFF162329),
        borderRadius: BorderRadius.circular(context.padding2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Interest',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is SuccessHomeSaveProfile) {
                    return InkWell(
                      onTap: () {
                        goToNamed(
                          context,
                          routeName: AddRemoveInterestView.routeName,
                          arguments: {
                            'data': state.profile.listInterest,
                          },
                        ).then((value) => {bloc.add(GetDataProfileEvent())});
                      },
                      child: Image.asset(
                        "assets/edit-2.png",
                        width: 17,
                        height: 17,
                      ),
                    );
                  }
                  return InkWell(
                    onTap: () {
                      goToNamed(
                        context,
                        routeName: AddRemoveInterestView.routeName,
                        arguments: {
                          'data': [],
                        },
                      ).then((value) => {bloc.add(GetDataProfileEvent())});
                    },
                    child: Image.asset(
                      "assets/edit-2.png",
                      width: 17,
                      height: 17,
                    ),
                  );
                },
              ),
            ],
          ),
          context.sbHeight(size: context.padding2),
          _bodyEmpty(context),
        ],
      ),
    );
  }

  Widget _bodyEmpty(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is SuccessHomeSaveProfile) {
          List<String> data = state.profile.listInterest ?? [];
          return data.isEmpty
              ? Column(
                  children: [
                    Text(
                      'Add in your your to help others know you better',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    context.sbHeight(size: context.padding2),
                  ],
                )
              : Wrap(
                  children: data.map((e) {
                    return _styleCard(context, e);
                  }).toList(),
                );
        }
        return Column(
          children: [
            Text(
              'Add in your your to help others know you better',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            context.sbHeight(size: context.padding2),
          ],
        );
      },
    );
  }

  Widget _styleCard(BuildContext context, String value) {
    return Container(
      constraints: const BoxConstraints(),
      margin: EdgeInsets.only(
        right: context.padding1,
        bottom: context.padding1,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: context.padding2, vertical: context.padding1),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        value,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
