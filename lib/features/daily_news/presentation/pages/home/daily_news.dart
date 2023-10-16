import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture_sample/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_clean_architecture_sample/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  _buildAppbar() {
    return AppBar(
      title: const Text(
        "Daily News",
        style: TextStyle(
          color: Colors.black
        )
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState> (
        builder: (_, state) {
          if(state is RemoteArticleLoading) {
            return const Center(child: CupertinoActivityIndicator());
          }

          if(state is RemoteArticlesError) {
            return const Center(child: Icon(Icons.refresh));
          }

          if(state is RemoteArticlesDone) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('$index'),
                );
              },
              itemCount: state.articles!.length,
            );
          }

          return const SizedBox();
        },
    );
  }
}
