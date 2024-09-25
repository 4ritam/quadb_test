import 'package:flutter/material.dart';
import 'package:quadb_test/src/views/details_screen.dart';

import '../models/show.dart';
import '../services/api_service.dart';
import '../widgets/search_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ApiService _apiService = ApiService();
  List<Show> _searchResults = [];
  bool _isLoading = false;

  final TextEditingController _searchController = TextEditingController();

  void _performSearch(String query) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final results = query.isEmpty
          ? await _apiService.getShows()
          : await _apiService.searchShows(query);
      setState(() {
        _searchResults = results;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _performSearch('');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: _searchController,
              onChanged: _performSearch,
              // autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Search for shows',
                prefixIcon: Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      return Hero(
                        tag: _searchResults[index].id,
                        child: Material(
                          child: SearchCard(
                            show: _searchResults[index],
                            width: MediaQuery.of(context).size.width / 3,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                      show: _searchResults[index]),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
