import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:eclipse_app/src/features/explore_people/presentation/explore_people_bloc/explore_people_bloc.dart';
import 'package:eclipse_app/src/themes/app_style.dart';
import 'package:eclipse_app/src/widgets/error_dialog.dart';
import 'package:eclipse_app/src/widgets/explore_people_buttom_widget.dart';
import 'package:eclipse_app/src/widgets/match_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExplorePeopleScreen extends StatefulWidget {
  const ExplorePeopleScreen({super.key});

  static const String routeName = '/explore-people';

  @override
  State<ExplorePeopleScreen> createState() => _ExplorePeopleScreenState();
}

class _ExplorePeopleScreenState extends State<ExplorePeopleScreen> {
  final cardController = AppinioSwiperController();

  @override
  void initState() {
    super.initState();
    context.read<ExplorePeopleBloc>().add(OnExplorePeopleEventCalled());
  }

  @override
  void dispose() {
    cardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          children: [
            AppSpace.vertical(50),
            BlocBuilder<ExplorePeopleBloc, ExplorePeopleState>(
              builder: (context, state) {
                if (state is ExplorePeopleLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ExplorePeopleLoaded) {
                  final users = state.users;
                  final cards = <Widget>[];
                  for (final user in users) {
                    cards.add(MatchCardWidget(user: user));
                  }
                  return Expanded(
                    child: Stack(
                      children: [
                        AppinioSwiper(
                          controller: cardController,
                          loop: true,
                          swipeOptions: const AppinioSwipeOptions.only(left: true, right: true),
                          direction: AppinioSwiperDirection.top,
                          padding: EdgeInsets.zero,
                          cardsBuilder: (BuildContext context, int index) {
                            return cards[index];
                          },
                          cardsCount: cards.length,
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: ExplorePeopleButtonWidget(
                                controller: cardController)),
                      ],
                    ),
                  );
                } else if (state is ExplorePeopleErrorState) {
                  return Center(
                    child: errorDialog(
                      message: state.message,
                      onPressed: () {
                        context
                            .read<ExplorePeopleBloc>()
                            .add(OnExplorePeopleEventCalled());
                      },
                    ),
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
