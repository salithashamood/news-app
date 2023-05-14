import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:utilities/utilities.dart';

part 'news_page_state.dart';

class NewsPageCubit extends Cubit<NewsPageState> {
  NewsPageCubit(this.article) : super(NewsPageInitial());

  final Article article;

  Widget setImage(image) {
    if (image != null) {
      return Image.network(
        image,
        fit: BoxFit.fill,
      );
    } else {
      return Image.asset('assets/icons/logo.jpg');
    }
  }
}
