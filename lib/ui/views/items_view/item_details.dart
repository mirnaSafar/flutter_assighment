import 'package:assignment_test/core/cubit/item_details_cubit.dart';
import 'package:assignment_test/core/utils/error.dart';
import 'package:assignment_test/ui/shared/custom_widgets/custom_text.dart';
import 'package:assignment_test/ui/shared/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ItemDetailsWidget extends StatefulWidget {
  const ItemDetailsWidget({Key? key, required this.itemID}) : super(key: key);
  final int itemID;

  @override
  State<ItemDetailsWidget> createState() => _ItemDetailsWidgetState();
}

class _ItemDetailsWidgetState extends State<ItemDetailsWidget> {
  @override
  void initState() {
    context.read<ItemDetailsCubit>().getItemDetails(widget.itemID);

    super.initState();
  }

  Map<String, dynamic>? _itemDetailsModel; //TODO Change type
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Center(child: BlocBuilder<ItemDetailsCubit, ItemDetailsState>(
        builder: (context, state) {
          if (state is FeatchingItemdetailsProgress) {
            return const SpinKitCircle(
              color: Colors.blue,
            );
          } else if (state is ErrorFetchingItemdetails) {
            return buildError(size);
          } else {
            _itemDetailsModel =
                BlocProvider.of<ItemDetailsCubit>(context).itemDetails;
            return Padding(
              padding: const EdgeInsets.all(30.0),
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: (size.width / 5),
                    ),
                    padding: EdgeInsets.all(
                      (size.width / 20),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(50)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: (size.width / 3),
                          child: Image.network(
                            'assets/images/phone.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        30.ph,
                        CustomText(
                            text: 'Type: ${_itemDetailsModel!["type"]}',
                            bold: true),
                      ],
                    ),
                  ),
                  const CustomText(text: 'Related Items: ', bold: true),
                  (size.width / 60).ph,
                  SizedBox(
                    height: size.width / 4,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: _itemDetailsModel!["related"]!.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          indent: 30,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return CircleAvatar(
                          minRadius: 50,
                          child: Text(_itemDetailsModel!['related']![index]
                                  ['name'] ??
                              ''),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      )),
    );
  }
}
