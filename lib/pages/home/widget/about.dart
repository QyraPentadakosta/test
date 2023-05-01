import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../application/extensions/image_picker/image_picker.dart';
import '../../../application/shared/image/image_convert.dart';
import '../../../core/extensions/context_extensions.dart';
import '../bloc/bloc.dart';
import '../bloc/state.dart';
import '../model/model_about_profile.dart';
import '../view_model/view_model.dart';
import 'text_field_row.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, provider, child) {
        return Listener(
          onPointerDown: (event) => FocusScope.of(context).unfocus(),
          child: Container(
            width: context.mQWidth(1),
            constraints: const BoxConstraints(
              minHeight: 120,
            ),
            padding: EdgeInsets.all(context.padding2),
            decoration: BoxDecoration(
              color: const Color(0xFF162329),
              borderRadius: BorderRadius.circular(context.padding2),
            ),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is LoadingHomeSaveProfile) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is SuccessHomeSaveProfile) {
                  return provider.isEditAbout
                      ? _bodyEditedAbout(context)
                      : _bodyEditAbout(state.profile, context);
                }
                return provider.isEditAbout
                    ? _bodyEditedAbout(context)
                    : _bodyEditAbout(null, context);
              },
            ),
            // : _bodyEditAbout(null, context),
          ),
        );
      },
    );
  }

  Widget _bodyEditAbout(ModelAboutProfile? profile, BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: profile != null
              ? MainAxisAlignment.start
              : MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'About',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (profile != null) {
                      provider.setData(profile);
                    }
                    provider.iEditAbout();
                  },
                  child: Image.asset(
                    "assets/edit-2.png",
                    width: 17,
                    height: 17,
                  ),
                ),
              ],
            ),
            profile != null
                ? _bodyWithData(context, profile)
                : _bodyWithOutData(context),
          ],
        );
      },
    );
  }

  Widget _bodyWithOutData(BuildContext context) {
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
  }

  Widget _bodyWithData(BuildContext context, ModelAboutProfile profile) {
    return Column(
      children: [
        context.sbHeight(size: context.padding2),
        styleKeyValue(
          "Birthday:",
          " ${profile.dob.text.replaceAll(' ', ' / ')} (Age ${profile.age})",
        ),
        context.sbHeight(size: context.padding2),
        styleKeyValue(
          "Horoscope:",
          " ${profile.horoscope.text}",
        ),
        context.sbHeight(size: context.padding2),
        styleKeyValue(
          "Zodiac:",
          " ${profile.zodiac.text}",
        ),
        context.sbHeight(size: context.padding2),
        styleKeyValue(
          "Zodiac:",
          " ${profile.height.text} cm",
        ),
        context.sbHeight(size: context.padding2),
        styleKeyValue(
          "Zodiac:",
          " ${profile.weight.text} kg",
        ),
      ],
    );
  }
  // " ${} "

  Widget styleKeyValue(String key, String value) {
    return Row(
      children: [
        Text(
          key,
          style: TextStyle(
            color: Colors.white.withOpacity(0.33),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _bodyEditedAbout(BuildContext context) {
    return Column(
      children: [
        _textEditAbout(context),
        context.sbHeight(size: context.padding2),
        _addImageEditAbout(context),
        context.sbHeight(size: context.padding2),
        _formEditAbout(),
      ],
    );
  }

  Widget _textEditAbout(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);
    return Consumer<HomeViewModel>(
      builder: (context, provider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'About',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            InkWell(
              onTap: () {
                provider.saveActionProfile(bloc, context);
              },
              child: Text(
                "Save & Update",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
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
            )
          ],
        );
      },
    );
  }

  Widget _addImageEditAbout(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, provider, child) {
        return Row(
          children: [
            InkWell(
              onTap: () async {
                String? data =
                    await ImagePickerExtensions().callAlertGetImage(context);
                provider.getImageProfile(data);
              },
              child: Row(
                children: [
                  Container(
                    height: 57,
                    width: 57,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(17),
                      image: provider.modelAboutProfile.image != null
                          ? DecorationImage(
                              image: MemoryImage(
                                ImageConvert().base64ToImage(
                                    provider.modelAboutProfile.image!),
                              ),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: provider.modelAboutProfile.image != null
                        ? null
                        : Container(
                            padding: const EdgeInsets.all(16),
                            child: Image.asset(
                              'assets/add.png',
                            ),
                          ),
                  ),
                  context.sbWidth(size: context.padding2),
                  const Text(
                    "Add image",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _formEditAbout() {
    return Consumer<HomeViewModel>(
      builder: (context, provider, child) {
        return Column(
          children: [
            TextFieldRow(
              controller: provider.modelAboutProfile.displayName,
              label: "Display name:",
              hintText: "Enter name",
            ),
            TextFieldRow(
              controller: provider.modelAboutProfile.gender,
              label: "Gender:",
              selectOption: true,
              hintText: "Select Gender",
            ),
            TextFieldRow(
              controller: provider.modelAboutProfile.dob,
              label: "Birthday:",
              hintText: "DD MM YYYY",
              datePicker: true,
              onChanged: (value) {
                provider.getHoroscope(value);
                provider.getShio(value);
                provider.countAge(value);
              },
            ),
            TextFieldRow(
              controller: provider.modelAboutProfile.horoscope,
              label: "Horoscope:",
              hintText: "--",
              readOnly: true,
            ),
            TextFieldRow(
              controller: provider.modelAboutProfile.zodiac,
              label: "Zodiac:",
              hintText: "--",
              readOnly: true,
            ),
            TextFieldRow(
              controller: provider.modelAboutProfile.height,
              label: "Height:",
              hintText: "Add height",
              keyboardType: TextInputType.number,
              suffixWidget: const Text(
                "cm",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            TextFieldRow(
              controller: provider.modelAboutProfile.weight,
              label: "Weight:",
              hintText: "Add weight",
              keyboardType: TextInputType.number,
              suffixWidget: const Text(
                "kg",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
