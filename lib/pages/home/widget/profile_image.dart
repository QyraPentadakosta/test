import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/shared/image/image_convert.dart';
import '../../../core/extensions/context_extensions.dart';
import '../bloc/bloc.dart';
import '../bloc/state.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is LoadingHomeSaveProfile) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Container(
          width: context.mQWidth(1),
          height: 190,
          padding: EdgeInsets.all(context.padding2),
          decoration: BoxDecoration(
            color: const Color(0xFF162329),
            borderRadius: BorderRadius.circular(context.padding2),
            image: state is SuccessHomeSaveProfile
                ? DecorationImage(
                    image: MemoryImage(
                      ImageConvert().base64ToImage(
                        state.profile.image ?? "",
                      ),
                    ),
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                child: Text(
                  state is HomeSuccessState
                      ? state.modelUser.userName
                      : state is SuccessHomeSaveProfile
                          ? state.profile.displayName.text
                          : "-",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
