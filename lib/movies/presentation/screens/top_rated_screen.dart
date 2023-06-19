import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:watch_it_app/core/services/services_locator.dart';
import 'package:watch_it_app/core/utils/dummy.dart';
import 'package:watch_it_app/movies/presentation/cotroller/movies_bloc.dart';
import 'package:watch_it_app/movies/presentation/cotroller/movies_states.dart';

import '../../../core/network/api_constants.dart';
import '../../../core/utils/request_states.dart';
import '../cotroller/movies_events.dart';
import 'movie_detail_screen.dart';

class TopRatedScreen extends StatelessWidget {
  static const String routeName = 'top rated screen';

  const TopRatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MoviesBloc>()..add(GetTopRatedMovieEvent()),
      child: BlocBuilder<MoviesBloc, MoviesStates>(
        builder: (context, state) {
          switch (state.topRatedState) {
            case RequestState.loading:
              return const Center(child: CircularProgressIndicator());
            case RequestState.loaded:
              return Scaffold(
                appBar: AppBar(
                  scrolledUnderElevation: 0,
                  elevation: 0,
                  title: const Text('Top Rated Movies'),
                  centerTitle: true,
                ),
                body: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  //padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  itemCount: moviesList.length,
                  itemBuilder: (context, index) {
                    final movie = state.topRatedMovies[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black,
                      ),
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.all(8),
                      //padding: EdgeInsets.all(5),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MovieDetailScreen(id: movie.id)));

                                /// TODO : NAVIGATE TO  MOVIE DETAILS
                              },
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0)),
                                child: CachedNetworkImage(
                                  width: 120.0,
                                  height: 150,
                                  fit: BoxFit.cover,
                                  imageUrl: ApiConstants.imageUrl(
                                      movie.backdropPath!),
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                    baseColor: Colors.grey[850]!,
                                    highlightColor: Colors.grey[800]!,
                                    child: Container(
                                      height: 150.0,
                                      width: 120.0,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: SizedBox(
                                    width: 200,
                                    child: Text(movie.title,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 2.0,
                                        horizontal: 8.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.red[700],
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      child: Text(
                                        movie.releaseDate.split('-')[0],
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 15.0,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '(${movie.voteAverage})',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                                //SizedBox(height: 3,),
                                Flexible(
                                  child: SizedBox(
                                    height: 60,
                                    width: 200,
                                    child: Text(
                                      "${movie.overview.substring(0, 70)}...",
                                      style: const TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            case RequestState.error:
              return Center(
                child: Text(
                  state.topRatedMessage,
                ),
              );
          }
        },
      ),
    );
  }
}
