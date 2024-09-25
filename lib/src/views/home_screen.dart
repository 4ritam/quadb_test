import 'package:flutter/material.dart';
import 'package:quadb_test/src/models/show.dart';
import 'package:quadb_test/src/widgets/landing_card.dart';
import 'package:quadb_test/src/widgets/show_card.dart';

import '../services/api_service.dart';

/// The home screen displaying a list of shows.
class HomeScreen extends StatefulWidget {
  final VoidCallback searchCallback;
  const HomeScreen({super.key, required this.searchCallback});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedShowIndex = 0;
  final ApiService _apiService = ApiService();
  late Future<List<Show>> _shows;
  List<Show> shows = [];
  @override
  void initState() {
    super.initState();
    _shows = _apiService.getShows();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<List<Show>>(
            future: _shows,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                shows = snapshot.data!;
                return Stack(
                  children: [
                    FutureBuilder(
                        future: ColorScheme.fromImageProvider(
                            provider: Image.network(
                                    shows[selectedShowIndex].mediumImageUrl)
                                .image),
                        builder: (context, snap) {
                          return Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  snap.data?.inversePrimary ?? Colors.black,
                                  Colors.black,
                                ],
                                stops: const [0, 0.45],
                                // stops: [0.1, 1],
                              ),
                            ),
                          );
                        }),
                    SafeArea(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: LandingCard(
                              show: shows[selectedShowIndex],
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 207,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return ShowCard(
                                  show: shows[index],
                                  onTap: () {
                                    setState(() {
                                      selectedShowIndex = index;
                                    });
                                  },
                                  isHero: index == selectedShowIndex,
                                  width: 140,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(child: Text('No shows found'));
              }
            },
          ),
          Positioned(
            top: 16,
            right: 16,
            child: SafeArea(
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: IconButton(
                  icon: const Icon(Icons.search),
                  color: Colors.white,
                  onPressed: widget.searchCallback,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
