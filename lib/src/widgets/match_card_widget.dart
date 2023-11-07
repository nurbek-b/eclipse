import 'package:carousel_slider/carousel_slider.dart';
import 'package:eclipse_app/src/features/explore_people/data/model/user.dart';
import 'package:eclipse_app/src/features/explore_people/presentation/explore_people_bloc/explore_people_bloc.dart';
import 'package:eclipse_app/src/features/explore_people/presentation/images_cubit/images_cubit.dart';
import 'package:eclipse_app/src/themes/app_assets.dart';
import 'package:eclipse_app/src/themes/app_color.dart';
import 'package:eclipse_app/src/widgets/custom_text_widget.dart';
import 'package:eclipse_app/src/widgets/error_dialog.dart';
import 'package:eclipse_app/src/widgets/glass_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchCardWidget extends StatelessWidget {
  const MatchCardWidget({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        context.read<ImagesCubit>().fetchImages();
        _displayUserImages(context);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.primary,
          border: Border.all(width: 5, color: AppColor.secondary),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          alignment: const Alignment(0, .9),
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            image: AssetImage(AppAsset.images('profile.jpg')),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                          top: 10,
                          left: 10,
                          child: TitleCardWidget(user: user)),
                    ],
                  ),
                  CustomTextWidget(user.email),
                  CustomTextWidget(user.company.name),
                  CustomTextWidget(user.company.catchPhrase),
                  CustomTextWidget(user.company.bs),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _displayUserImages(BuildContext context) async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<ImagesCubit, ImagesState>(
            builder: (context, state) {
              if (state is ImagesLoadedState) {
                return Dialog(
                  child: Stack(
                    children: [
                      CarouselSlider(
                        items: state.images
                            .map((imagePath) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          AppAsset.images(imagePath)),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ))
                            .toList(),
                        options: CarouselOptions(
                          aspectRatio: 9 / 16,
                          viewportFraction: 1,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is ImagesLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ImagesErrorState) {
                return Center(
                  child: errorDialog(
                    message: state.message,
                    onPressed: () {
                      context
                          .read<ExplorePeopleBloc>()
                          .add(OnUsersImagesFetchEventCalled());
                    },
                  ),
                );
              }
              return const SizedBox();
            },
          );
        });
  }
}
