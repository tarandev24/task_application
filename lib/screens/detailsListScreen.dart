
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_application/bloc/bloc.dart';
import 'package:task_application/model/sampleDataModel.dart';

class DetailsListScreen extends StatefulWidget {
  const DetailsListScreen({Key? key}) : super(key: key);
  static const routeName = '/details-screen';
  @override
  State<DetailsListScreen> createState() => _DetailsListScreenState();
}

class _DetailsListScreenState extends State<DetailsListScreen> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double screenHeight = mediaQueryData.size.height;
    final double screenWidth = mediaQueryData.size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Sample Data'),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 10.0),
          child: BlocBuilder<ScreenBloc, ScreenState>(
            builder: (context, state) {
              if (state is ScreenSuccess) {
                if (state.data.isEmpty) {
                  return Container(
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Text(
                      'No data Found',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                }
                return ListView.builder(
                    padding: MediaQuery.of(context).padding.copyWith(top: 0),
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      SampleData data = state.data[index];
                      return Padding(
                        padding: const EdgeInsets.only(top:15.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                            ),
                          ),
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('${data.id})'),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                      width: screenWidth - 75,
                                      child: Text(data.title!))
                                ],
                              ),
                              const Divider(),
                              const Text(
                                'Description',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              Text(data.body!),
                            ],
                          ),
                        ),
                      );
                    });
              }

              return Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                child: const CupertinoActivityIndicator(),
              );
            },
          ),
        ));
  }
}
