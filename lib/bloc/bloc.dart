import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:task_application/model/sampleDataModel.dart';
part 'event.dart';
part 'state.dart';

class ScreenBloc extends Bloc<ScreenEvent, ScreenState> {
  ScreenBloc() : super(ScreenInitial()) {
    on<FetchData>(fetchData);
  }

  Future fetchData(event, state) async {
    emit(ScreenLoading());
    var response = await http.get(
        Uri.parse(
          'https://jsonplaceholder.typicode.com/posts',
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
    );
    if(response.statusCode != 200) return;
    var responseBody =  json.decode(response.body);

    List<SampleData> sampleData = [];

    for(int index=0; index<responseBody.length; index++){
      SampleData data = SampleData.fromJson(responseBody[index]);
      sampleData.add(data);
    }

    emit(ScreenSuccess(sampleData));

  }
}
