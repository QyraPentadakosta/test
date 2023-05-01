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
              state is SuccessHomeSaveProfile
                  ? Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF162329),
                        borderRadius: BorderRadius.circular(context.padding2),
                        gradient: RadialGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(1),
                          ],
                          stops: const [0.0, 1.0],
                          center: Alignment.center,
                          radius: 1,
                        ),
                      ),
                    )
                  : Container(),
              Positioned(
                bottom: 0,
                left: 0,
                child: Padding(
                  padding: EdgeInsets.all(context.padding2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state is HomeSuccessState
                            ? state.modelUser.userName
                            : state is SuccessHomeSaveProfile
                                ? "${state.profile.displayName.text}, ${state.profile.age}"
                                : "-",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      state is SuccessHomeSaveProfile
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                context.sbHeight(size: context.padding1),
                                Text(
                                  state.profile.gender.text,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                context.sbHeight(size: context.padding1),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: context.padding2,
                                        vertical: context.padding1,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.06),
                                        borderRadius: BorderRadius.circular(
                                          context.padding2,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/horoscope.png",
                                            width: 12,
                                            height: 12,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            state.profile.horoscope.text,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    context.sbWidth(size: context.padding1),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: context.padding2,
                                        vertical: context.padding1,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.06),
                                        borderRadius: BorderRadius.circular(
                                          context.padding2,
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/zodiac.png",
                                            width: 12,
                                            height: 12,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            state.profile.zodiac.text,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          : Container(),
                    ],
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
