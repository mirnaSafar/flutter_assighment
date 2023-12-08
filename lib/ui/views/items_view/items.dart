import 'package:assignment_test/core/cubit/internet_cubit.dart';
import 'package:assignment_test/core/cubit/item_details_cubit.dart';
import 'package:assignment_test/core/cubit/items_cubit.dart';
import 'package:assignment_test/core/data/models/item_model.dart';
import 'package:assignment_test/core/utils/error.dart';
import 'package:assignment_test/core/utils/general_utils.dart';
import 'package:assignment_test/ui/shared/custom_widgets/custom_text.dart';
import 'package:assignment_test/ui/shared/extensions.dart';
import 'package:assignment_test/ui/views/items_view/item_details.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsTab extends StatefulWidget {
  const ItemsTab({Key? key}) : super(key: key);

  @override
  State<ItemsTab> createState() => _ItemsTabState();
}

class _ItemsTabState extends State<ItemsTab> {
  List<ItemModel> items = [];
  @override
  void initState() {
    if (items.isEmpty) {
      context.read<ItemsCubit>().getAllItems();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocListener<InternetCubit, InternetState>(
            listener: (context, state) {
              if (state is InternetDisconnected) {
                showSnackbar(context, 'Internet Disconnected');
              }
              if (state is InternetConnected) {
                showSnackbar(context, 'Internet Connected');
              }
            },
            child: BlocConsumer<ItemsCubit, ItemsState>(
              listener: (context, state) {
                if (state is FeatchingItemsProgress) {
                  customLoader();
                }
              },
              builder: (context, state) {
                if (state is ItemsFetchedSuccessfully) {
                  BotToast.closeAllLoading();
                  items = BlocProvider.of<ItemsCubit>(context).items;
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return BlocProvider(
                        create: (context) => ItemDetailsCubit(),
                        child: InkWell(
                          onTap: () => context.push(ItemDetailsWidget(
                            itemID: items[index].id!,
                          )),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            child: Column(children: [
                              CustomText(
                                  text:
                                      '${items[index].id} ${items[index].name} '),
                              10.ph,
                              CustomText(text: items[index].price.toString()),
                            ]),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is ErrorFetchingItems) {
                  BotToast.closeAllLoading();
                  return buildError(size, text: 'no internet connection');
                }
                return Container();
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              context.read<ItemsCubit>().getAllItems();
            },
            child: const Text('Load items'),
          )
        ],
      ),
    );
  }
}
